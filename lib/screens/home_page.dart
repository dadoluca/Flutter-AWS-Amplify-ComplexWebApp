import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:reply_project_management/variables/my_colors.dart';
import 'package:reply_project_management/widgets/home_grid.dart';

import '../variables/device_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homepage-screen';

  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.symmetric(vertical: BorderSide(width: 2, color: Colors.white.withOpacity(0.2)))
          ),
              child: //Image.asset('../assets/images/logo.png'),
              Row(
                children: [
                  const SizedBox(width: 6,),
                  const Icon(Icons.rocket, size: 40,),
                  const SizedBox(width: 8,),
                  Text('BLUE PLAN', style:
                  TextStyle(fontSize: DeviceInfo.sizeTitle2,
                      fontWeight: FontWeight.bold),)
                ],
              )
        ),
        leadingWidth: 200,
        title: Text(
          'Home',
          style: TextStyle(
              fontSize: DeviceInfo.screenWidth! > 800 ? 22 : 18,
  ),
        ),
        actions: [
          SignOutButton(),

        ],
      ),
      body:  Container(/*
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
          ),*/
          padding: const EdgeInsets.only(top:15, left: 20, right: 20, bottom: 10),
          child: HomeGrid()),
    );
  }
}
