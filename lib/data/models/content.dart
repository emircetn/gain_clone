import 'dart:math';

import 'package:gain_clone/init/enums/content_type.dart';

enum ContentTypes {
  series,
  movie,
  program,
  documentary,
}

class Content {
  final int id;
  final String name;
  final String explanation;
  final ContentTypes contentType;
  final String coverImageUrl;
  final String? videoUrl;
  final int partCount;
  final double? imdbScore;

  Content({
    required this.id,
    required this.name,
    required this.explanation,
    required this.contentType,
    required this.coverImageUrl,
    required this.partCount,
    this.videoUrl,
    this.imdbScore,
  });

  static List<String> get getContentTypeNames => [
        ContentType.actual.rawValue,
        ContentType.series.rawValue,
        ContentType.movie.rawValue,
        ContentType.program.rawValue,
      ];

  bool get containsOnePart => partCount == 1;

  static List<String> get movieList => const [
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ];

  String get showContentType {
    switch (contentType) {
      case ContentTypes.series:
        return 'Dizi';
      case ContentTypes.movie:
        return 'Film';
      case ContentTypes.program:
        return 'Program';
      case ContentTypes.documentary:
        return 'Belgesel';
    }
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      explanation: map['explanation'] ?? '',
      contentType: ContentTypes.values[map['contentType'] ?? 0],
      coverImageUrl: map['coverImageUrl'] ?? '',
      imdbScore: map['imdbScore']?.toDouble(),
      videoUrl: movieList[Random().nextInt(movieList
          .length)], //Sadece tek part olanlar için atanması gerekiyor. videoUrl'i dbye eklemedim o yüzden kontrol de yapmadan hepsine atıyorum. dbye eklenince güncellenmeli
      partCount: map['partCount'] ?? 1,
    );
  }

  factory Content.temp() {
    return Content(
      name: 'Ayak İşleri',
      explanation:
          'Tecrübeli görev adamı Vedat ve felsefe okumuş, politik doğrucu Evren, zengin bir iş adamının ‘aşırı önemli’ ayak işleri için görevlendirilen ikilidir. Biri gözlerini kapayıp vazifesini yapan, diğeri attığı her adımı sorgulayan bu uyumsuz ikili, her bölüm başka bir maceraya doğru yola çıkar. Fakat görev icabı çatıştıklarından daha fazla, kendi içlerinde çatışırlar',
      contentType: ContentTypes.series,
      coverImageUrl:
          'https://m.media-amazon.com/images/M/MV5BZGI0ZTJmY2EtMDI1MS00NWZmLTk2MzQtM2EyN2QzNDcyZTZhXkEyXkFqcGdeQXVyNDg4MjkzNDk@._V1_.jpg',
      imdbScore: 7.9,
      id: 0,
      partCount: 2,
    );
  }
}
