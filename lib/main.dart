import 'dart:html';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
// Amplify Flutter Packages
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/graphic_providers/projects_borders.dart';
// import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:reply_project_management/graphic_providers/show_grid.dart';
import 'package:reply_project_management/providers/colleagues.dart';
import 'package:reply_project_management/providers/customers_referents.dart';
import 'package:reply_project_management/providers/releases.dart';
import 'package:reply_project_management/screens/customer_detail_screen.dart';
import 'package:reply_project_management/screens/customers_overview_screen.dart';
import 'package:reply_project_management/screens/home_page.dart';
import 'package:reply_project_management/screens/basic_screen.dart';
import 'package:reply_project_management/variables/my_colors.dart';
import '../providers/customers.dart';
import '../providers/projects.dart';
import '../screens/project_detail_screen.dart';
import '../screens/projects_overview_screen.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

Future<void> _configureAmplify() async {
  final api = AmplifyAPI(modelProvider: ModelProvider.instance);
  // final analytics = AmplifyAnalyticsPinpoint();
  final auth = AmplifyAuthCognito();
  await Amplify.addPlugins([auth, api]); // , analytics

  try {
    await Amplify.configure(amplifyconfig);
    print('Amplify succesfully configured!');
    // await Amplify.Analytics.recordEvent(event: AnalyticsEvent('AmplifyConfigured'));
  } on AmplifyAlreadyConfiguredException {
    print(
        'Tried to reconfigure Amplify; this can occur when your app restarts.');
  }
}

// TODO: Move sign in logic to a separate file
Future<void> signInWithWebUI() async {
  try {
    final result = await Amplify.Auth.signInWithWebUI(
        provider: const AuthProvider.oidc("****DETAILS_NOT_SHARED****",
            "****DETAILS_NOT_SHARED****"));
    print('Sign in result: $result');
    // await Amplify.Analytics.recordEvent(event: AnalyticsEvent('SignInSuccessful'));
  } on AuthException catch (e) {
    // await Amplify.Analytics.recordEvent(event: AnalyticsEvent('SignInFailed'));
    print('Error signing in: ${e.message}');
  }
}

Future<AWSCredentials> federatedLogin(String? token) async {
  // TODO: Add error handling
  const provider = AuthProvider.oidc(
      "cognito-idp.eu-central ****DETAILS_NOT_SHARED****/",
      "cognito-idp.eu-central ****DETAILS_NOT_SHARED****");
  final plugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
  final session = await plugin.federateToIdentityPool(
    token: token ?? "",
    provider: provider,
  );
  print("Federated Login successful");
  // await Amplify.Analytics.recordEvent(event: AnalyticsEvent('FederatedLoginSuccessful'));
  return session.credentials;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  // TODO: avoid sign in if session exists
  if (!Uri.base.queryParameters.containsKey('code')) {
    signInWithWebUI();
  } else {
    var session = await Amplify.Auth.fetchAuthSession();
    if (!session.isSignedIn) {
      federatedLogin(Uri.base.queryParameters['code']);
    }
    print("Sign in completed");
    // await Amplify.Analytics.recordEvent(event: AnalyticsEvent('SignInCompleted'));
    runApp(MyReplyApp());
    print("App running");
  }
}

class MyReplyApp extends StatefulWidget {
  @override
  State<MyReplyApp> createState() => _MyReplyAppState();
}

class _MyReplyAppState extends State<MyReplyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Projects(),
        ),
        ChangeNotifierProvider(
          create: (context) => Customers(),
        ),
        ChangeNotifierProvider(
          create: (context) => Releases(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShowGrid(),
        ),
        ChangeNotifierProvider(
          create: (context) => Colleagues(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomersReferents(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectsBorders(),
        ),
      ],
      child: Authenticator(
        child: MaterialApp(
            title: 'Blue Plan',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: myColors.primaryMaterial,
              scaffoldBackgroundColor: myColors.background,
            ),
            builder: Authenticator.builder(),
            home: HomePage(),
            routes: {
              ProjectDetailScreen.routeName: (ctx) => ProjectDetailScreen(),
              HomePage.routeName: (ctx) => const HomePage(),
              ProjectsOverviewScreen.routeName: (ctx) =>
                  ProjectsOverviewScreen(),
              BasicScreen.routeName: (ctx) =>
                   const BasicScreen(),
              CustomersOverviewScreen.routeName: (ctx) =>
                  const CustomersOverviewScreen(),
              CustomerDetailScreen.routeName: (ctx) => CustomerDetailScreen(),
            }),
      ),
    );
  }
}

///--- end ---------------------------------------------------------------------------------------------
