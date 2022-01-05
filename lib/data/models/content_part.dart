import 'dart:math';

class ContentPart {
  final int? part;
  final String? name;
  final String coverUrl;
  final String videoUrl;
  final double videoAspectRatio;
  final String explanation;

  ContentPart({
    this.name,
    required this.part,
    required this.coverUrl,
    required this.videoUrl,
    this.videoAspectRatio = 1.7,
    required this.explanation,
  });

  static List<String> get partList => const [
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ];

  String get showPartNoAndName {
    if (part == null || part == 0) {
      return ' - $name';
    } else if (name == null) {
      return ' - $part. Bölüm';
    } else {
      return '- $part. Bölüm - $name ';
    }
  }

  String get showPartNoAndNameForCover {
    if (part == null || part == 0) {
      return '$name';
    } else {
      return 'Bölüm $part';
    }
  }

  String get showPartNoAndNameForPlayer {
    if (part == null || part == 0) {
      return '$name';
    } else {
      return '$part. Bölüm';
    }
  }

  factory ContentPart.fromMap(Map<String, dynamic> map) {
    return ContentPart(
      part: map['part']?.toInt() ?? 0,
      name: map['name'],
      coverUrl: map['coverUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? partList[Random().nextInt(partList.length)],
      videoAspectRatio: map['videoAspectRatio']?.toDouble() ?? 1.7,
      explanation: map['explanation'] ?? '',
    );
  }
}
