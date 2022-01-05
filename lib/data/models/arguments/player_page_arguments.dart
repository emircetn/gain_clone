import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';

class PlayerPageArguments {
  final Content content;
  final List<ContentPart> partList;
  final int selectedContentIndex;

  const PlayerPageArguments({
    required this.content,
    required this.partList,
    required this.selectedContentIndex,
  });
}
