/**
 * A "scaffold" widget that contains other widgets such as various input and modification forms,
 *  can be used by any widget to be displayed on a new page.
 */

import 'package:flutter/material.dart';
import '../variables/my_colors.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen();
  static const routeName = '/basic-screen';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Widget? w = arguments['widget'] as Widget?;
    String? s = arguments['title'] as String?;
    return Scaffold(
      appBar: AppBar(
        title:  Text(s!),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Colors.white,
              myColors.primary,
              myColors.primary.withOpacity(0.8),
              myColors.primary.withOpacity(0.5),
            ],
            stops: const [
              0.0,
              0.7,
              1.0,
            ],
          ),
        ),
        child: Center(
          child: w,
        ),
      ),
    );
  }
}
