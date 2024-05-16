import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/screens/basic_screen.dart';
import 'package:reply_project_management/widgets/forms/insert_costumer_form.dart';

import '../variables/device_info.dart';
import '../providers/customers.dart';
import '../widgets/buttons/BluePlan_button_logo.dart';
import '../widgets/buttons/add_button.dart';
import '../widgets/customers_list.dart';
import 'home_page.dart';

class CustomersOverviewScreen extends StatelessWidget{
  const CustomersOverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/customers-overview-screen';


  @override
  Widget build(BuildContext context) {
    var _alreadyFetch = false;
    DeviceInfo.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BluePlanButtonLogo(),
        leadingWidth: 200,
        title: Text(
          'Censimento Clienti',
          style: TextStyle(fontSize: DeviceInfo.screenWidth! > 800 ? 22 : 18),
        ),
        actions: [
          SignOutButton(),
        ],
      ),
      body: FutureBuilder(
          future: _alreadyFetch
              ? Future(() => null)
              : Provider.of<Customers>(context, listen: false)
                  .fetchAndSetCustomers(),
          builder: (ctx, dataSnapshot) {
            _alreadyFetch = true;
            //is loading..
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (dataSnapshot.error != null) {
              //error handling
              print(dataSnapshot.error);
              return const Center(
                child: Text('An error occurred!'),
              );
            } else {
              return Container(/*
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                        '../assets/images/crm.jpg' //'https://cdn.dribbble.com/users/310943/screenshots/4271067/media/d7f224443548bef1770507e8f530d642.png?compress=1&resize=800x600&vertical=top' //'https://cdn.dribbble.com/users/992274/screenshots/14029048/media/4f8b74bfc306f3951831ac91935699d7.png?compress=1&resize=1200x900&vertical=top',
                        ),
                    opacity: 0.6,
                    fit: BoxFit.fill,
                  ),
                ),*/
                padding: EdgeInsets.all(DeviceInfo.screenWidth! * 0.015),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(flex: 1, child: Center()),
                    Expanded(flex: 4, child: CustomersList()),
                    Expanded(flex: 1, child: Center()),
                  ],
                ),
              );
            }
          }),

      floatingActionButton:AddButton(() {
        Navigator.of(context).pushNamed(BasicScreen.routeName,
            arguments: {
              'title':"Aggiungi Cliente",
              'widget':InsertCostumerForm(), }
        );

      },),
    );
  }
}
