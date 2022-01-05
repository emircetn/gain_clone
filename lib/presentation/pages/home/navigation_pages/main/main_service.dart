import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_header.dart';
import 'package:gain_clone/managers/network_manager.dart';

class MainService {
  static MainService? _instace;
  static MainService get instance {
    _instace ??= MainService._init();
    return _instace!;
  }

  MainService._init();
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<ContentHeader>?> getContentsHeaders() async {
    try {
      final response = await _networkManager.dio.get(
        ServicePath.contentHeaders.rawValue.toJson,
      );

      if (response.statusCode == HttpStatus.ok) {
        final contentHeaderList = (response.data as List)
            .map((e) => ContentHeader.fromMap(e as Map<String, dynamic>))
            .toList()
            .cast<ContentHeader>();
        return contentHeaderList;
      }
    } catch (e) {
      debugPrint('getContentsHeaders error: ' + e.toString());
      return null;
    }
  }

  Future<List<Content>?> getHeaderContents(List<int> contentIDList) async {
    try {
      final contentList = <Content>[];
      for (int contentID in contentIDList) {
        final content = await getContent(contentID);
        if (content != null) {
          contentList.add(content);
        }
      }

      return contentList;
    } catch (e) {
      debugPrint('getContents error: ' + e.toString());
      return null;
    }
  }

  Future<Content?> getContent(int id) async {
    try {
      final response = await _networkManager.dio
          .get('${ServicePath.contents.rawValue}/$id'.toJson);

      if (response.statusCode == HttpStatus.ok) {
        return Content.fromMap(response.data);
      }
    } catch (e) {
      debugPrint('getContent error: ' + e.toString());
      return null;
    }
  }
}
