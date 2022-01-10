import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/search/search_service.dart';

class SearchViewModel extends ChangeNotifier {
  SearchService searchService = SearchService.instance;

  List<Content>? foundedContents;
  List<ContentPart>? popularContentParts;

  String searchText = '';
  bool isLoading = true;

  bool get isInitialState => searchText.isEmpty;

  SearchViewModel() {
    getPopularContentParts();
  }

  void getPopularContentParts() async {
    popularContentParts = await searchService.getPopularContentParts();
    changeLoading();
  }

  void searchContent(String text) async {
    searchText = text; //TODO:performans için delay eklenebilir
    if (text.isEmpty) {
      notifyListeners();
      return;
    }
    changeLoading();
    foundedContents = await searchService.searchContent(text);
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
