import 'package:json_annotation/json_annotation.dart';
part 'content_part.g.dart';

@JsonSerializable(createToJson: false)
class ContentPart {
  final int? part;
  @JsonKey(name: 'name')
  final String contentName;
  final String? partName;
  final String coverUrl;
  @JsonKey(
      defaultValue:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
  final String videoUrl;
  final double videoAspectRatio;
  final String explanation;

  ContentPart({
    required this.part,
    required this.contentName,
    this.partName,
    required this.coverUrl,
    required this.videoUrl,
    this.videoAspectRatio = 1.7,
    required this.explanation,
  });

  String get showPartNoAndName {
    if (part == null || part == 0) {
      return ' - $partName';
    } else if (partName == null) {
      return ' - $part. Bölüm';
    } else {
      return '- $part. Bölüm - $partName ';
    }
  }

  String get showPartNoAndNameForCover {
    if (part == null || part == 0) {
      return '$partName';
    } else {
      return 'Bölüm $part';
    }
  }

  String get showPartNoAndNameForPlayer {
    if (part == null || part == 0) {
      return '$partName';
    } else {
      return '$part. Bölüm';
    }
  }

  factory ContentPart.fromJson(Map<String, dynamic> json) =>
      _$ContentPartFromJson(json);
}
