import 'package:dio/dio.dart';

enum ServicePath { contents, banners, contentHeaders, contentParts }

class NetworkManager {
  static NetworkManager? _instace;
  static NetworkManager get instance {
    if (_instace != null) return _instace!;
    _instace = NetworkManager._init();
    return _instace!;
  }

  final String _baseUrl = 'https://gain-clone-default-rtdb.firebaseio.com/';
  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }
}

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.contents:
        return '/contents';
      case ServicePath.contentHeaders:
        return '/contentHeaders';
      case ServicePath.contentParts:
        return '/contentParts';
      case ServicePath.banners:
        return '/banner';
    }
  }
}

extension PathExtensions on String {
  String get toJson => '$this.json';
}
