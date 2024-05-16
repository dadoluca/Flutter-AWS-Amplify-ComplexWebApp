import 'package:flutter/material.dart';

class ShowGrid with ChangeNotifier {
  bool isGrid = false;

  void toggleDispositionStatus()
  {
    isGrid=!isGrid;
    notifyListeners();
  }
}