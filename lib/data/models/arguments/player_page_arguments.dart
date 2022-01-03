import 'package:gain_clone/data/models/content.dart';

class PlayerPageArguments {
  final Content content;
  final int selectedContentIndex;

  const PlayerPageArguments({
    required this.content,
    required this.selectedContentIndex,
  });
}
