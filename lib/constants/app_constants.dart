class AppConstants {
  static AppConstants? _instace;
  static AppConstants get instance {
    _instace ??= AppConstants._init();
    return _instace!;
  }

  AppConstants._init();
  List<String> tabs = [
    'Güncel',
    'Haber',
    'Dizi',
    'Film',
    'Program',
    'Belgesel',
    'Müzik',
    'Spor'
  ];
}
