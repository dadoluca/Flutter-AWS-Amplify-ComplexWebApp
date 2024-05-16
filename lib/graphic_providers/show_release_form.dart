import 'package:flutter/material.dart';

class ShowReleaseForm with ChangeNotifier {
  bool isShown = false;

  void toggleVisibility()
  {
    isShown=!isShown;
    notifyListeners();
  }
}