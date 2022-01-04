import 'dart:convert';

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

  factory ContentPart.temp() {
    return ContentPart(
      name: 'Özel',
      part: 1,
      coverUrl: 'https://assets-jpcust.jwpsrv.com/thumbnails/f2ffc680-640.jpg',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      explanation:
          'Tecrübeli görev adamı Vedat ve felsefe okumuş, politik doğrucu Evren, zengin bir iş adamının ‘aşırı önemli’ ayak işleri için görevlendirilen ikilidir. Biri gözlerini kapayıp vazifesini yapan, diğeri attığı her adımı sorgulayan bu uyumsuz ikili, her bölüm başka bir maceraya doğru yola çıkar. Fakat görev icabı çatıştıklarından daha fazla, kendi içlerinde çatışırlar.',
    );
  }
  factory ContentPart.temp2() {
    return ContentPart(
      name: 'Tüzel',
      part: 2,
      coverUrl: 'https://assets-jpcust.jwpsrv.com/thumbnails/f2ffc680-640.jpg',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      explanation: 'Değişik bir açıklama',
    );
  }
  factory ContentPart.temp3() {
    return ContentPart(
      name: 'Özel Gibi',
      part: 3,
      coverUrl: 'https://assets-jpcust.jwpsrv.com/thumbnails/f2ffc680-640.jpg',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      explanation: 'Daha fazla değişik',
    );
  }

  String get showPartNoAndName {
    //TODO:geliştirilmeli
    if (part == null) {
      return ' - $name';
    } else if (name == null) {
      return ' - $part. Bölüm';
    } else {
      return '- $part. Bölüm - $name ';
    }
  }

  String get showOnlyPartOrName {
    //TODO:geliştirilmeli
    if (part == null) {
      return '$name';
    } else {
      return '$part. Bölüm';
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'part': part,
      'name': name,
      'coverUrl': coverUrl,
      'videoUrl': videoUrl,
      'videoAspectRatio': videoAspectRatio,
      'explanation': explanation,
    };
  }

  factory ContentPart.fromMap(Map<String, dynamic> map) {
    return ContentPart(
      part: map['part']?.toInt() ?? 0,
      name: map['name'],
      coverUrl: map['coverUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      videoAspectRatio: map['videoAspectRatio']?.toDouble() ?? 1.7,
      explanation: map['explanation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentPart.fromJson(String source) =>
      ContentPart.fromMap(json.decode(source));
}
