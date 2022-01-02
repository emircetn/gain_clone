import 'package:gain_clone/data/models/content.dart';

class ContentPart {
  final int id;
  final String? name;
  final String coverUrl;
  final String videoUrl;
  final String explanation;

  ContentPart({
    this.name,
    required this.id,
    required this.coverUrl,
    required this.videoUrl,
    required this.explanation,
  });

  factory ContentPart.temp() {
    return ContentPart(
      name: 'Özel',
      id: 3,
      coverUrl: 'https://assets-jpcust.jwpsrv.com/thumbnails/f2ffc680-640.jpg',
      videoUrl: '',
      explanation:
          'Tecrübeli görev adamı Vedat ve felsefe okumuş, politik doğrucu Evren, zengin bir iş adamının ‘aşırı önemli’ ayak işleri için görevlendirilen ikilidir. Biri gözlerini kapayıp vazifesini yapan, diğeri attığı her adımı sorgulayan bu uyumsuz ikili, her bölüm başka bir maceraya doğru yola çıkar. Fakat görev icabı çatıştıklarından daha fazla, kendi içlerinde çatışırlar.',
    );
  }
}
