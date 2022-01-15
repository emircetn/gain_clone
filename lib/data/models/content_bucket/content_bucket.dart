import 'package:gain_clone/data/models/content/content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_bucket.g.dart';

@JsonSerializable(createToJson: false)
class ContentBucket {
  final String name;
  final List<int> contentIDs;
  @JsonKey(ignore: true)
  List<Content>? contentList;

  ContentBucket({required this.name, required this.contentIDs});

  factory ContentBucket.fromJson(Map<String, dynamic> json) =>
      _$ContentBucketFromJson(json);
}
