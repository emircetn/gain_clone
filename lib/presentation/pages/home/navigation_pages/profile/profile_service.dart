import 'package:flutter/material.dart';

//TODO:methodlar yazılacak
class ProfileService {
  static ProfileService? _instace;
  static ProfileService get instance {
    _instace ??= ProfileService._init();
    return _instace!;
  }

  ProfileService._init();

  //final NetworkManager _networkManager = NetworkManager.instance;

  Future<bool> updateNameAndSurname() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      debugPrint('updateNameAndSurname error: ' + e.toString());
      return false;
    }
  }

  Future<bool> updateBrithday() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      debugPrint('updateBrithday error: ' + e.toString());
      return false;
    }
  }

  Future<bool> changeEMessagePermission() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      debugPrint('changeEMessagePermission error: ' + e.toString());
      return false;
    }
  }

  Future<bool> changeIsOpenDataSavingMode() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    } catch (e) {
      debugPrint('changeEMessagePermission error: ' + e.toString());
      return false;
    }
  }
}
