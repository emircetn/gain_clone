import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_header.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main/main_service.dart';

class MainViewModel extends ChangeNotifier {
  final MainService mainService = MainService.instance;
  int currentPageIndex = 0;
  ContentHeader? contentHeader;
  bool isLoadingHeader = true;
  bool isLoadingBody = true;
  List<Content>? bannerContents;

  MainViewModel() {
    Future.wait([
      getBannerContents(),
      getAllContentsHeaders(),
    ]);
  }

  void onTap(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  Future<void> getBannerContents() async {
    bannerContents = await mainService.getBannerContents();
    if (bannerContents != null) {
      isLoadingHeader = false;
      notifyListeners();
    }
  }

  Future<void> getAllContentsHeaders() async {
    contentHeader = await mainService.getContentsHeaders();
    isLoadingBody = false;
    notifyListeners();
  }
}
