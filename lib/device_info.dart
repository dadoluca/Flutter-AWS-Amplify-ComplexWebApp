import 'package:flutter/material.dart';

class DeviceInfo {
  static MediaQueryData? _mediaQueryData;
  static double? adattableWidth;
  static double? screenWidth;
  static double? screenHeight;
  static double? sizeTitle1;
  static double? sizeTitle2;
  static double? sizeTitle3;
  static double? sizeText;
  static double? iconSize;



  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width;
    adattableWidth = screenWidth! > 400 ?
    screenWidth!/2.5 : screenWidth!;
    screenHeight = _mediaQueryData?.size.height;
    sizeTitle1 = screenWidth! > 400 ?
    screenWidth! > 700 ?
    screenWidth! > 1000 ?
    screenWidth! > 1400 ?
    screenWidth! > 1900 ?
    26: 24 : 22 : 21 :20 :18;
    sizeTitle2 = screenWidth! > 400 ?
    screenWidth! > 700 ?
    screenWidth! > 1000 ?
    screenWidth! > 1400 ?
    screenWidth! > 1900 ?
    22: 21 : 20 : 19 :18 :17;
    sizeTitle3 = screenWidth! > 400 ?
    screenWidth! > 700 ?
    screenWidth! > 1000 ?
    screenWidth! > 1400 ?
    screenWidth! > 1900 ?
    20: 19 : 18 : 17 :16 :14;
    //(adattableWidth! * 0.035);
    sizeText = screenWidth! > 400 ?
    screenWidth! > 700 ?
    screenWidth! > 1000 ?
    screenWidth! > 1400 ?
    screenWidth! > 1900 ?
        18: 17 : 16 : 15 :14 :12;
    //(adattableWidth! * 0.032);
    iconSize =  screenWidth! > 1000 ? 25 : 20;
  }
}