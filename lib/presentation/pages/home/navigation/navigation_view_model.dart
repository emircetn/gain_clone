import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  int currentTab = 0;
  late final PageController pageController;

  NavigationViewModel() {
    pageController = PageController(initialPage: currentTab);
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void tabChanged(int index) {
    pageController.jumpToPage(index);
    currentTab = index;
    notifyListeners();
  }
}
