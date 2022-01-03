import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/user.dart';
import 'package:gain_clone/managers/user_manager.dart';
import 'package:provider/provider.dart';

class ProfileViewModel extends ChangeNotifier {
  Future<bool> updateNameAndSurname(
      BuildContext context, String newValue) async {
    //TODO:servis eklenecek
    await Future.delayed(const Duration(seconds: 1));
    context.read<UserManager>().setUser = User.temp(newValue);
    return true;
  }

  Future<bool> updateBrithday(BuildContext context, String newValue) async {
    //TODO:servis eklenecek
    return true;
  }
}
