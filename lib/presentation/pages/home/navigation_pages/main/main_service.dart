import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/managers/network_manager.dart';

class MainService {
  Future getContents() async {
    /* final response = */ await NetworkManager.instance.dio.post(
      ServicePath.contents.rawValue,
      data: Content.temp().toJson(),
    );
/* 
    switch (response.statusCode) {
      case HttpStatus.ok:
        final contentList = response.data
            .map((e) => Content.fromMap(e))
            .toList()
            .cast<Content>();
        return contentList;
      default:
        return Future.error(response.statusCode.toString());
    } */
  }
}
