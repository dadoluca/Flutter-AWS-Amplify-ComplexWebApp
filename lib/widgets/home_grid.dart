import 'package:flutter/material.dart';
import 'package:reply_project_management/variables/device_info.dart';
import 'package:reply_project_management/screens/customers_overview_screen.dart';
import 'package:reply_project_management/screens/home_page.dart';
import 'package:reply_project_management/screens/projects_overview_screen.dart';
import 'package:reply_project_management/widgets/home_item_list.dart';
import '../variables/my_colors.dart';
class HomeGrid extends StatelessWidget {
  HomeGrid({Key? key}) : super(key: key);

  var menu = [
    {
      'title': 'GESTIONE PROGETTI',
      'icon': Icons.engineering,
      'items': [
        {
          'title': 'Censimento Progetti', //'ELENCO PROGETTI',
          'route': ProjectsOverviewScreen.routeName
        },
        {
          'title': 'Pianificazioni', //'PIANIFICAZIONI',
          'route': HomePage.routeName
        },
        {
          'title': 'Reportistica', //'REPORTISTICA',
          'route': HomePage.routeName
        }
      ]
    },
    {
      'title': 'CRM',
      'icon': Icons.person_search,
      'items': [
        {'title': 'Censimento Clienti', 'route': CustomersOverviewScreen.routeName},
        {'title': 'Generatore Offerte', 'route': HomePage.routeName},
      ]
    },
    {
      'title': 'AREA AMMINISTRATIVA',
      'icon': Icons.savings,
      'items': [
        {'title': 'Finanziamenti', 'route': HomePage.routeName},
        {'title': 'Fatturazioni', 'route': HomePage.routeName},
      ]
    },
    {
      'title': 'GDPR E LICENZE',
      'icon': Icons.notifications,
      'items': [
        {'title': 'Utenze', 'route': HomePage.routeName},
        {'title': 'Dispositivi', 'route': HomePage.routeName},
        {'title': 'Licenze', 'route': HomePage.routeName},
      ]
    },
    {
      'title': 'RISORSE',
      'icon': Icons.groups,
      'items': [
        {'title': 'Elenco Risorse', 'route': HomePage.routeName},
        {'title': 'Gestione Team', 'route': HomePage.routeName},
        {'title': 'Richiesta Ferie', 'route': HomePage.routeName},
      ]
    },
    {
      'title': 'IMPOSTAZIONI',
      'icon': Icons.settings,
      'items': [
        {'title': 'Gestione Accessi e Ruoli', 'route': HomePage.routeName},
        {'title': 'Impostazioni tecniche', 'route': HomePage.routeName},
      ]
    },
    {
      'title': 'DOCUMENTAZIONE',
      'icon': Icons.description,
      'items': [
        {'title': 'Testo di prova', 'route': HomePage.routeName},
        {'title': 'Testo di prova', 'route': HomePage.routeName},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: DeviceInfo.screenWidth! > 800
              ? DeviceInfo.screenWidth! > 1800
                  ? 3
                  : 2
              : 1,
          childAspectRatio: 3.3,
          mainAxisSpacing: 22,
          crossAxisSpacing: 30),
      itemCount: menu.length,
      itemBuilder: (ctx, i) => Container(
        child: Row(
          children: [
            buildBlueContainer(context, menu[i]['title'].toString(),
                menu[i]['icon'] as IconData),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  itemCount: (menu[i]['items'] as List).length,
                  itemBuilder: (ctx, j) {
                    var items = menu[i]['items'] as List;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: HomeItemList(items![j]['title'], () {
                        Navigator.of(context).pushNamed(items![j]['route']);
                      }),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Container buildBlueContainer(
      BuildContext context, String title, IconData icon) {
    return Container(
      width: 240,
      height: double.infinity,
      padding: EdgeInsets.only(
        left: DeviceInfo.screenWidth! > 1000 ? 30 : 20,
        right: DeviceInfo.screenWidth! > 1000 ? 30 : 20,
        top: DeviceInfo.screenHeight! > 800 ? 30 : 10,
        bottom: DeviceInfo.screenHeight! > 800 ? 30 : 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: myColors.primary, width: 1.3),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            myColors.primary.withOpacity(1),
    //        myColors.primary.withOpacity(0.9),
            myColors.primary.withOpacity(0.9),
      //      myColors.primary.withOpacity(0.9),
            myColors.primary.withOpacity(0.6),
          ],
          stops: [
            0.0,
  //          0.15,
            0.5,
//            0.85,
            1.0,
          ],
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Spacer(),
        Text(
          title,
          style:
              TextStyle(color: Colors.white, fontSize: DeviceInfo.sizeTitle3),
        ),
        Spacer(),
        Icon(
          icon,
          color: Colors.white,
          size: DeviceInfo.screenWidth! > 1000 ? 60 : 50,
        ),
        Spacer(),
      ]),
    );
  }
}
