import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gain_clone/data/models/content_part.dart';
import 'package:gain_clone/managers/network_manager.dart';

class ContentService {
  static ContentService? _instace;
  static ContentService get instance {
    _instace ??= ContentService._init();
    return _instace!;
  }

  ContentService._init();
  final NetworkManager _networkManager = NetworkManager.instance;

  Future<List<ContentPart>?> getContentParts(int id) async {
    try {
      final response = await _networkManager.dio
          .get('${ServicePath.contentParts.rawValue}/$id'.toJson);

      if (response.statusCode == HttpStatus.ok) {
        final contentPartList = response.data
            .map((e) => ContentPart.fromMap(e as Map<String, dynamic>))
            .toList()
            .cast<ContentPart>();
        return contentPartList;
      }
    } catch (e) {
      debugPrint('getContentParts error: ' + e.toString());
      return null;
    }
  }
}