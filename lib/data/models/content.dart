import 'dart:math';

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
}
