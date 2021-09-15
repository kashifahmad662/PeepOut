import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class valueProvider with ChangeNotifier, DiagnosticableTreeMixin{

  String ?_userFirstName;
  String ?_userLastName;

  String get firstname => _userFirstName.toString();
  String get lastname => _userLastName.toString();

  void firstName(String _firstName){
    _userFirstName = _firstName.toString();
    notifyListeners();
  }
  void lastName(String _lastName){
    _userLastName = _lastName.toString();
    notifyListeners();
  }

}
