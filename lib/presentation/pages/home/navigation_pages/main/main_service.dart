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

  Future<ContentHeader?> getContentsHeaders() async {
    try {
      final response = await _networkManager.dio.get(
        ServicePath.contentHeaders.rawValue.toJson,
      );

      if (response.statusCode == HttpStatus.ok) {
        final contentHeader =
            ContentHeader.fromMap(response.data as Map<String, dynamic>);
        for (int contentBucketListIndex = 0;
            contentBucketListIndex < contentHeader.contentBucketList.length;
            contentBucketListIndex++) {
          final contentList = <Content>[];
          for (var contentID in contentHeader
              .contentBucketList[contentBucketListIndex].contentIDs) {
            final content = await getContent(contentID);
            if (content != null) {
              contentList.add(content);
            }
          }
          contentHeader.contentBucketList[contentBucketListIndex].contentList =
              contentList;
        }
        return contentHeader;
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

  Future<List<Content>?> getBannerContents() async {
    try {
      final response =
          await _networkManager.dio.get(ServicePath.banners.rawValue.toJson);

      if (response.statusCode == HttpStatus.ok) {
        final contentIDList = response.data['contentIDs'];
        if (contentIDList != null) {
          final List<Content> contentList = [];
          for (int oneContentID in contentIDList) {
            final content = await getContent(oneContentID);
            if (content != null) {
              contentList.add(content);
            }
          }
          return contentList;
        }
      }
    } catch (e) {
      debugPrint('getContent error: ' + e.toString());
      return null;
    }
  }
}
