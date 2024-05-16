import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/graphic_providers/show_release_form.dart';
import 'package:reply_project_management/widgets/forms/insert_project_form.dart';
import 'package:reply_project_management/widgets/forms/insert_release_form.dart';
import '../variables/device_info.dart';
import 'dart:math';
import '../providers/projects.dart';
import '../graphic_providers/show_forms.dart';
import '../widgets/forms/insert_costumer_form.dart';
import '../variables/my_colors.dart';
import 'basic_screen.dart';

class InsertScreen extends StatelessWidget {
  static const routeName = '/insert-screen';

  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Aggiungi tu !'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              myColors.primary,
            ],
            stops: [
              0.1,
              1.0,
            ],
          ),
        ),
        child: Center(
          child: Provider.of<ShowForms>(context, listen:true).customerInsertForm_isShown
              ?  InsertCostumerForm()
            : Provider.of<ShowReleaseForm>(context, listen:true).isShown
              ? const InsertReleaseForm()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                          Provider.of<ShowForms>(context, listen:false).toggleCustomer();
                      },
                      child: Container(
                        height: DeviceInfo.screenWidth! * 0.27,
                        width: DeviceInfo.screenWidth! * 0.31,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.eventbrite.co.uk/blog/wp-content/uploads/2022/06/iStock-610133884.jpg'//'https://cdn.dribbble.com/users/310943/screenshots/4271067/media/d7f224443548bef1770507e8f530d642.png?compress=1&resize=800x600&vertical=top' //'https://cdn.dribbble.com/users/992274/screenshots/14029048/media/4f8b74bfc306f3951831ac91935699d7.png?compress=1&resize=1200x900&vertical=top',
                                ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Card(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Inserisci Cliente',
                                style: TextStyle(
                                    fontSize: DeviceInfo.sizeTitle1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                          Provider.of<ShowReleaseForm>(context, listen:false).toggleVisibility();
                      },
                      child: Container(
                        height: DeviceInfo.screenWidth! * 0.27,
                        width: DeviceInfo.screenWidth! * 0.31,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://www.tinypulse.com/hs-fs/hubfs/Time%20Management-2.jpg?width=4000&name=Time%20Management-2.jpg'//'https://cdn.dribbble.com/users/4893200/screenshots/11217801/media/e00ee735fbf198ba8a8ffb975e3e31d8.png?compress=1&resize=1200x900&vertical=top',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Card(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Inserisci Release',
                                style: TextStyle(
                                    fontSize: DeviceInfo.sizeTitle1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(BasicScreen.routeName);

                        //Provider.of<ShowForms>(context, listen:false).toggleProject();
                      },
                      child: Container(
                        height: DeviceInfo.screenWidth! * 0.27,
                        width: DeviceInfo.screenWidth! * 0.31,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://cdn.dribbble.com/users/124813/screenshots/4079382/505_characters-floydworx.png?compress=1&resize=800x600&vertical=top'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Card(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Inserisci Progetto',
                                style: TextStyle(
                                    fontSize: DeviceInfo.sizeTitle1,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
