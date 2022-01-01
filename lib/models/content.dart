enum ContentType {
  series,
  movie,
  program,
}

class Content {
  final String name;
  final String explanation;

  final ContentType contentType;
  final String coverImageUrl;
  final String videoUrl;

  const Content({
    required this.name,
    required this.explanation,
    required this.contentType,
    required this.coverImageUrl,
    required this.videoUrl,
  });

  factory Content.temp() {
    return const Content(
      name: 'Ayak İşleri',
      explanation:
          'Tecrübeli görev adamı Vedat ve felsefe okumuş, politik doğrucu Evren, zengin bir iş adamının ‘aşırı önemli’ ayak işleri için görevlendirilen ikilidir. Biri gözlerini kapayıp vazifesini yapan, diğeri attığı her adımı sorgulayan bu uyumsuz ikili, her bölüm başka bir maceraya doğru yola çıkar. Fakat görev icabı çatıştıklarından daha fazla, kendi içlerinde çatışırlar',
      contentType: ContentType.series,
      coverImageUrl:
          'https://m.media-amazon.com/images/M/MV5BZGI0ZTJmY2EtMDI1MS00NWZmLTk2MzQtM2EyN2QzNDcyZTZhXkEyXkFqcGdeQXVyNDg4MjkzNDk@._V1_.jpg',
      videoUrl: '',
    );
  }

  String showContentType() {
    switch (contentType) {
      case ContentType.series:
        return 'Dizi';
      case ContentType.movie:
        return 'Film';
      case ContentType.program:
        return 'Program';
    }
  }
}
