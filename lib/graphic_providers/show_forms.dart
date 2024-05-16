import 'package:flutter/material.dart';

class ShowForms with ChangeNotifier {
  bool customerInsertForm_isShown = false;
  bool projectInsertForm_isShown = false;
  bool projectUpdateForm_isShown = false;

  void toggleCustomer()
  {
    customerInsertForm_isShown=!customerInsertForm_isShown;
    notifyListeners();
  }
  void toggleProject()
  {
    projectInsertForm_isShown=!projectInsertForm_isShown;
    notifyListeners();
  }
  void toggleProjectUpdate()
  {
    projectUpdateForm_isShown=!projectUpdateForm_isShown;
    notifyListeners();
  }
}