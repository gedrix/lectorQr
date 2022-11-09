
import 'package:flutter/material.dart';

class UiProvider  extends ChangeNotifier{

  int _selectMenuOption =0;

  int get selectMenuOption{
    return this._selectMenuOption;
  }

  set selectMenuOption(i){
    this._selectMenuOption = i;
    notifyListeners();
  }  

}