import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content/content.dart';
import 'package:gain_clone/data/models/content_header/content_header.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main/main_service.dart';

class MainViewModel extends ChangeNotifier {
  final MainService mainService = MainService.instance;

  int currentPageIndex = 0;

  bool isLoadingHeader = true;
  bool isLoadingBody = true;

  List<Content>? bannerContents;
  ContentHeader? contentBuckets;

  MainViewModel() {
    Future.wait([
      getBannerContents(),
      getAllBuckets(),
    ]);
  }

  Future<void> getBannerContents() async {
    bannerContents = await mainService.getBannerContents();
    if (bannerContents != null) {
      isLoadingHeader = false;
      notifyListeners();
    }
  }

  Future<void> getAllBuckets() async {
    contentBuckets = await mainService.getAllBuckets();
    if (contentBuckets != null) {
      isLoadingBody = false;
      notifyListeners();
    }
  }

  void onTap(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}
