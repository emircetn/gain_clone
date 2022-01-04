import 'dart:convert';

class ContentHeader {
  final String name;
  final List<int> contentIDs;

  ContentHeader({required this.name, required this.contentIDs});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contentIDs': contentIDs,
    };
  }

  factory ContentHeader.fromMap(Map<String, dynamic> map) {
    return ContentHeader(
      name: map['name'] ?? '',
      contentIDs: List<int>.from(map['contentIDs']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentHeader.fromJson(String source) =>
      ContentHeader.fromMap(json.decode(source));
}
