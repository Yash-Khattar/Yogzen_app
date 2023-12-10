import 'package:flutter/material.dart';
import 'package:yogzen/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    name: "",
    email: "",
    password: "",
    userid: "",
    userType: "",
    token: "",
  );
  User get user => _user;
  void setUser(String user) {
    //user.fromJson(user) calls factory construtor
    _user = User.fromJson(user);
    notifyListeners();
  }
}
