import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  int currentTab = 0;

  void tabChanged(int index) {
    currentTab = index;
    notifyListeners();
  }
}
