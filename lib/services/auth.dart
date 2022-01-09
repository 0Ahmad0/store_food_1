import 'package:flutter/material.dart';

class Auth extends ChangeNotifier{

  bool _isLoggedIn = false;

  bool get authunticated => _isLoggedIn;

  void login(Map creds){
    print(creds);
    _isLoggedIn = true;
    notifyListeners();
  }

  void logOut(){
    _isLoggedIn = false;
    notifyListeners();
  }

}