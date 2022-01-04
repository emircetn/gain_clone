import 'package:flutter/material.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main/main_service.dart';

class MainViewModel extends ChangeNotifier {
  final TabController tabController;
  final MainService mainService = MainService();

  MainViewModel(this.tabController);

  void getContents() {
    mainService.getContents();
  }
}
