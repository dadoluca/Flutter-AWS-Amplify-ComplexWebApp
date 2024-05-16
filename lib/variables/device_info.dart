import 'package:flutter/material.dart';

/**
 * The following are tests of using Flutter and MediaQuery to resize the content of the app
 * based on the screen size and make these display rules global and available for every widget.
   TODO rewrite this class to properly adapt the content of each page to all achievable sizes
   TODO use appropriate packages to determine if the app is running on mobile or desktop
 **/
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

///When this init function is called, the page dimensions are recalculated.
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
    sizeText = screenWidth! > 400 ?
    screenWidth! > 700 ?
    screenWidth! > 1000 ?
    screenWidth! > 1400 ?
    screenWidth! > 1900 ?
        18: 17 : 16 : 15 :14 :12;
    iconSize =  screenWidth! > 1000 ? 25 : 20;
  }
}