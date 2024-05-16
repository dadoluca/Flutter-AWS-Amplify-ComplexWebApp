/**
 * It is a class used to notify the widgets,
 * corresponding to the elements of the project list, to take on a new border
 */
import 'package:flutter/material.dart';
enum BorderOptions {
  None,
  Simple,
  Colored,
}

class ProjectsBorders with ChangeNotifier {
  BorderOptions _selectedBorder = BorderOptions.None;
   set selectedBorder(BorderOptions b){
     _selectedBorder = b;
     notifyListeners();
  }
  BorderOptions get selectedBorder{
    return _selectedBorder;
  }

}