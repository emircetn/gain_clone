import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/presentation/pages/home/content/content_service.dart';

class ContentViewModel extends ChangeNotifier {
  final ContentService contentService = ContentService.instance;

  bool isLoadingParts = true;
  List<ContentPart>? contentPartList;
  final Content content;

  ContentViewModel(this.content) {
    initialize();
  }

  Future<void> initialize() async {
    if (!content.containsOnePart) {
      contentPartList = await contentService.getContentParts(content.id);
      if (contentPartList != null) {
        isLoadingParts = false;
        notifyListeners();
      }
    } else {
      isLoadingParts = false;
      notifyListeners();
    }
  }
}
