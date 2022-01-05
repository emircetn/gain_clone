enum ContentType {
  series,
  movie,
  program,
  actual,
}

extension ContentTypeExtension on ContentType {
  String get rawValue {
    switch (this) {
      case ContentType.series:
        return 'Diziler';
      case ContentType.movie:
        return 'Filmler';
      case ContentType.program:
        return 'Programlar';
      case ContentType.actual:
        return 'Gündem';
    }
  }
}

List<String> get getContentTypes => [
      ContentType.actual.rawValue,
      ContentType.series.rawValue,
      ContentType.movie.rawValue,
      ContentType.program.rawValue,
    ];
