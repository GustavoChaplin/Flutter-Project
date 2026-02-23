import 'package:flutter/material.dart';
import 'package:flutterproject/Requests/UserRequest.dart';

class UserState extends ChangeNotifier {
  User? _user;
  int? pageIndex = 0;

  User? get user => _user;

  void setUser(User value) {
    _user = value;
    notifyListeners();
  }

  void setPageIndex(int value) {
    pageIndex = value;
    notifyListeners();
  }
}