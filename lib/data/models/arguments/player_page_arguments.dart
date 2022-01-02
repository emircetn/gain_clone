import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';

class PlayerPageArguments {
  final Content content;
  final ContentPart contentPart;

  const PlayerPageArguments({
    required this.content,
    required this.contentPart,
  });
}
