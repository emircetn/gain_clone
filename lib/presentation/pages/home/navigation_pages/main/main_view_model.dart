import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content_header.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/main/main_service.dart';

class MainViewModel extends ChangeNotifier {
  final MainService mainService = MainService.instance;
  int currentPageIndex = 0;
  List<ContentHeader>? contentHeaderList;
  bool isLoadingHeader = true;
  bool isLoadingBody = true;

  MainViewModel() {
    initialize();
  }

  void onTap(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  Future<void> initialize() async {
    contentHeaderList = await mainService.getContentsHeaders();
    if (contentHeaderList != null) {
      bool result;
      result = await getHeaderContents(0);
      if (result) {
        isLoadingHeader = false;
        notifyListeners();
      }
      for (int i = 1; i < contentHeaderList!.length; i++) {
        await getHeaderContents(i);
      }
      isLoadingBody = false;
      notifyListeners();
    }
  }

  Future<bool> getHeaderContents(int id) async {
    try {
      contentHeaderList![id].contentList = await mainService
          .getHeaderContents(contentHeaderList![id].contentIDs);
      return true;
    } catch (e) {
      debugPrint('getHeaderContents error in $id' + e.toString());
      return false;
    }
  }
}
