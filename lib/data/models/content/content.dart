import 'package:gain_clone/init/enums/content_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

enum ContentTypes {
  @JsonValue(0)
  series,
  @JsonValue(1)
  movie,
  @JsonValue(2)
  program,
  @JsonValue(3)
  documentary,
}

@JsonSerializable(createToJson: false)
class Content {
  final int id;
  final String name;
  final String explanation;
  final ContentTypes contentType;
  final String coverImageUrl;
  @JsonKey(
      defaultValue:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
  final String? videoUrl;
  @JsonKey(defaultValue: 1)
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

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

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
