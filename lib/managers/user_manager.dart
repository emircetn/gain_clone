import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/user.dart';

class UserManager extends ChangeNotifier {
  User? _user = User.temp();

  User? get user => _user;

  set setUser(User updatedUser) {
    _user = updatedUser;
    notifyListeners();
  }
}
