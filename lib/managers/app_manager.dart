import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AppManager extends ChangeNotifier {
  String? appVersion;
  AppManager() {
    getAppVersion();
  }

  void getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;
    appVersion = '$version ($buildNumber)';
  }
}
