import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content/content.dart';
import 'package:gain_clone/data/models/content_part/content_part.dart';
import 'package:gain_clone/presentation/pages/home/content/content_service.dart';

class ContentViewModel extends ChangeNotifier {
  final ContentService contentService = ContentService.instance;

  bool isLoadingParts = true;
  List<ContentPart>? contentPartList;
  List<Content>? simularContents;

  final Content content;
  final GlobalKey scoreButtonKey = GlobalKey();
  bool isScoreState = false;
  bool? isLike;

  int selectedPageIndex = 0;

  ContentViewModel(this.content) {
    initialize();
  }

  Future<void> initialize() async {
    if (!content.containsOnePart) {
      contentPartList = await contentService.getContentParts(content.id);
      simularContents =
          await contentService.getSimularContents(content.contentType);
      if (contentPartList != null) {
        isLoadingParts = false;
        notifyListeners();
      }
    } else {
      isLoadingParts = false;
      notifyListeners();
    }
  }

  void scoreStateUpdate() {
    isScoreState = !isScoreState;
    notifyListeners();
  }

  void isLikeUpdated(bool? like) {
    isLike = like;
    notifyListeners();
  }

  void updateSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }
}

//https://stackoverflow.com/a/58788092/15047718
extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}
