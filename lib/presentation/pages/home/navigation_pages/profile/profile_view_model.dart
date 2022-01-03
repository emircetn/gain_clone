import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/user.dart';
import 'package:gain_clone/managers/user_manager.dart';
import 'package:gain_clone/utils/app_functions.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileViewModel extends ChangeNotifier {
  Future<bool> updateNameAndSurname(
      BuildContext context, String newValue) async {
    //TODO:servis eklenecek
    await Future.delayed(const Duration(seconds: 1));
    context.read<UserManager>().setUser = User.temp(nameAndSurname: newValue);
    return true;
  }

  Future<bool> updateBrithday(BuildContext context, String newValue) async {
    await Future.delayed(const Duration(seconds: 1));
    //TODO:servis eklenecek

    context.read<UserManager>().setUser =
        User.temp(brithday: DateFormat('dd/MM/yyy').parse(newValue));
    return true;
  }

  void changeEMessagePermission(BuildContext context, bool value) {
    context.read<UserManager>().setUser =
        User.temp(isHaveEMessagePermission: value);
    //TODO:Dbye yazılmalı
    if (value) {
      AppFunctions.showSnackBar(
        context: context,
        message: 'Elektronik ileti izinleriniz aktifleştirilmiştir.',
        isSuccess: true,
      );
    } else {
      AppFunctions.showSnackBar(
        context: context,
        message:
            'Elektronik ileti izinleriniz kaldırılmıştır, dilediğiniz zaman tekrar aktif hale getirilmiştir.',
        isSuccess: false,
      );
    }
  }

  void changeIsOpenDataSavingMode(BuildContext context, bool value) {
    context.read<UserManager>().setUser =
        User.temp(isOpenDataSavingMode: value);
  }
}
