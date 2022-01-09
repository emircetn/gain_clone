import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/user.dart';
import 'package:gain_clone/managers/user_manager.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/profile/profile_service.dart';
import 'package:gain_clone/utils/app_functions.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileService profileService = ProfileService.instance;

  Future<bool> updateNameAndSurname(
      BuildContext context, String newValue) async {
    final result = await profileService.updateNameAndSurname();
    if (result == true) {
      final userManager = context.read<UserManager>();
      userManager.setUser = userManager.user!.copyWith(
        nameAndSurname: newValue,
      );
    }

    return result;
  }

  Future<bool> updateBrithday(BuildContext context, String newValue) async {
    DateTime? brithday;
    try {
      brithday = DateFormat('dd/MM/yyy').parse(newValue);
    } catch (e) {
      return false;
    }
    final result = await profileService.updateBrithday();
    if (result == true) {
      final userManager = context.read<UserManager>();
      userManager.setUser = userManager.user!.copyWith(
        brithday: brithday,
      );
    }

    return result;
  }

  Future<void> changeEMessagePermission(
      BuildContext context, bool value) async {
    final userManager = context.read<UserManager>();
    userManager.setUser = userManager.user!.copyWith(
      isHaveEMessagePermission: value,
    );
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

    final result = await profileService.changeEMessagePermission();
    if (result == false) {
      userManager.setUser = userManager.user!.copyWith(
        isHaveEMessagePermission: !value,
      );
    }
  }

  Future<void> changeIsOpenDataSavingMode(
      BuildContext context, bool value) async {
    final userManager = context.read<UserManager>();
    userManager.setUser = userManager.user!.copyWith(
      isOpenDataSavingMode: value,
    );

    final result = await profileService.changeIsOpenDataSavingMode();
    if (result == false) {
      userManager.setUser = userManager.user!.copyWith(
        isOpenDataSavingMode: !value,
      );
    }
  }
}
