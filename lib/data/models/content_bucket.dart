import 'package:gain_clone/data/models/content.dart';

class ContentBucket {
  final String name;
  final List<int> contentIDs;
  List<Content>? contentList;

  ContentBucket({required this.name, required this.contentIDs});

  factory ContentBucket.fromMap(Map<String, dynamic> map) {
    return ContentBucket(
      name: map['name'] ?? '',
      contentIDs: List<int>.from(map['contentIDs']),
    );
  }
}
