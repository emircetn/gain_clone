import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/presentation/pages/home/content/content_service.dart';

class ContentViewModel extends ChangeNotifier {
  final ContentService contentService = ContentService.instance;

  bool isLoadingParts = true;
  List<ContentPart>? contentPartList;
  final Content content;
  final GlobalKey scoreButtonKey = GlobalKey();
  bool isScoreState = false;
  bool? isLike;

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

  void scoreStateUpdate() {
    isScoreState = !isScoreState;
    notifyListeners();
  }

  void isLikeUpdated(bool? like) {
    isLike = like;
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
