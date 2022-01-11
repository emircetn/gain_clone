import 'dart:math';

//TODO: json serializaible kullanılabilir
class ContentPart {
  final int? part;
  final String contentName;
  final String? partName;
  final String coverUrl;
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

  static List<String> get partList => const [
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ];

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

  factory ContentPart.fromMap(Map<String, dynamic> map) {
    return ContentPart(
      part: map['part']?.toInt() ?? 0,
      contentName: map['name'],
      partName: map['partName'],
      coverUrl: map['coverUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? partList[Random().nextInt(partList.length)],
      videoAspectRatio: map['videoAspectRatio']?.toDouble() ?? 1.7,
      explanation: map['explanation'] ?? '',
    );
  }
}
