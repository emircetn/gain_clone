import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/managers/network_manager.dart';

class SearchService {
  static SearchService? _instace;
  static SearchService get instance {
    _instace ??= SearchService._init();
    return _instace!;
  }

  SearchService._init();

  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<Content>?> searchContent(String text) async {
    try {
      final response = await _networkManager.dio.get(
        ServicePath.contents.rawValue.toJson,
        queryParameters: {
          "orderBy": '"name"',
          "startAt": '"$text"',
          "endAt": '"$text\uf8ff"',
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null) {
          final contentList = <Content>[];
          Map<String, dynamic> map = Map<String, dynamic>.from(response.data);
          map.forEach((key, value) {
            contentList.add(Content.fromMap(value as Map<String, dynamic>));
          });
          return contentList;
        }
      }
    } catch (e) {
      debugPrint('searchContent error: ' + e.toString());
      return null;
    }
  }

  //TODO:temp olarak yazıldı güncellenecek
  Future<List<ContentPart>?> getPopularContentParts() async {
    try {
      final response = await _networkManager.dio.get(
        ServicePath.contentParts.rawValue.toJson,
        queryParameters: {
          "orderBy": '"watchedCount"',
          "limitToLast": 1,
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null) {
          final contentPartList = <ContentPart>[];
          Map<String, dynamic> map = Map<String, dynamic>.from(response.data);

          for (var oneMap in map['2']) {
            contentPartList
                .add(ContentPart.fromMap(oneMap as Map<String, dynamic>));
          }

          return contentPartList;
        }
      }
    } catch (e) {
      debugPrint('getPopularContentParts error: ' + e.toString());
      return null;
    }
  }
}
