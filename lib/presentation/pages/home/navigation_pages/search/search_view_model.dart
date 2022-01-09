import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/presentation/pages/home/navigation_pages/search/search_service.dart';

class SearchViewModel extends ChangeNotifier {
  SearchService searchService = SearchService.instance;

  List<Content>? foundedContents;
  List<ContentPart>? popularContentParts;

  String searchedText = '';
  bool isLoading = true;

  bool get isInitialState => searchedText.isEmpty;

  SearchViewModel() {
    getPopularContentParts();
  }

  void getPopularContentParts() async {
    popularContentParts = await searchService.getPopularContentParts();
    changeLoading();
  }

  void searchContent(String text) async {
    popularContentParts = await searchService.getPopularContentParts();
    changeLoading(); //TODO:
    /* searchedText = text;
    if (text.isEmpty) {
      notifyListeners();
      return;
    }
    changeLoading();
    foundedContents = await searchService.searchContent(text);
    changeLoading(); */
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
