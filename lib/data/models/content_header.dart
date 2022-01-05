import 'dart:convert';

import 'package:gain_clone/data/models/content.dart';

class ContentHeader {
  final String name;
  final List<int> contentIDs;
  final ContentTypes contentType;
  List<Content>? contentList;

  ContentHeader({
    required this.name,
    required this.contentIDs,
    required this.contentType,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contentIDs': contentIDs,
      'contentType': contentType.index,
    };
  }

  factory ContentHeader.fromMap(Map<String, dynamic> map) {
    return ContentHeader(
      name: map['name'] ?? '',
      contentIDs:
          map['contentIDs'] != null ? List<int>.from(map['contentIDs']) : [],
      contentType: ContentTypes.values[map['contentType'] ?? 0],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentHeader.fromJson(String source) =>
      ContentHeader.fromMap(json.decode(source));
}
