class ContentPart {
  final int id;
  final String? name;
  final String coverUrl;
  final String videoUrl;
  final double videoAspectRatio;
  final String explanation;

  ContentPart({
    this.name,
    required this.id,
    required this.coverUrl,
    required this.videoUrl,
    this.videoAspectRatio = 1.7,
    required this.explanation,
  });

  factory ContentPart.temp() {
    return ContentPart(
      name: 'Özel',
      id: 1,
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
      id: 2,
      coverUrl: 'https://assets-jpcust.jwpsrv.com/thumbnails/f2ffc680-640.jpg',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      explanation: 'Değişik bir açıklama',
    );
  }
  factory ContentPart.temp3() {
    return ContentPart(
      name: 'Özel Gibi',
      id: 3,
      coverUrl: 'https://assets-jpcust.jwpsrv.com/thumbnails/f2ffc680-640.jpg',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      explanation: 'Daha fazla değişik',
    );
  }

  String get showID {
    //TODO:geliştirilmeli
    if (id == 0) {
      return 'Fragman';
    } else {
      return '$id.Bölüm';
    }
  }
}
