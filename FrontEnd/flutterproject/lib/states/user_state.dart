import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  String? _user;

  String? get user => _user;

  void setUser(String value) {
    _user = value;
    notifyListeners();
  }
}
