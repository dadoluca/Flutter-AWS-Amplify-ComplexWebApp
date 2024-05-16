/**
 * It is a class that globally specifies the colors used in the pages,
 * from which it is possible to change the primary color used throughout the application
 * or the color of "error", "success" etc., or eventually define other secondary colors
 */

import 'package:flutter/material.dart';
class myColors {
  static const Color primary =Color(0xff0170a6); ///Blue Reply blue
  static const Color error = Color(0xffee6176);
  static const Color background = Color(0xffebeeee);
  static const Color warning = Color(0xffffecd6);
  static const Color success = Color(0xff64c5b6);

  static const MaterialColor primaryMaterial = MaterialColor(
      0xff0170a6,
       _myMatirialLightGreen);

  static const Map<int, Color> _myMatirialLightGreen =
  {
    50: Color.fromRGBO(1, 112, 166, 0.10196078431372549),
    100: Color.fromRGBO(1, 112, 166, .2),
    200: Color.fromRGBO(1, 112, 166, .3),
    300: Color.fromRGBO(1, 112, 166, .4),
    400: Color.fromRGBO(1, 112, 166, .5),
    500: Color.fromRGBO(1, 112, 166, .6),
    600: Color.fromRGBO(1, 112, 166, .7),
    700: Color.fromRGBO(1, 112, 166, .8),
    800: Color.fromRGBO(1, 112, 166, .9),
    900: Color.fromRGBO(1, 112, 166, 1),
  };
}