import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String username = '';
  String name = '';
  String family = '';

  void setUserData(String username, String name, String family) {
    this.username = username;
    this.name = name;
    this.family = family;
    notifyListeners();
  }
}
