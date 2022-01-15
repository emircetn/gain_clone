import 'package:gain_clone/data/models/content_bucket/content_bucket.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_header.g.dart';

@JsonSerializable(createToJson: false)
class ContentHeader {
  final String name;
  @JsonKey(name: 'contentBuckect')
  final List<ContentBucket> contentBucketList;

  ContentHeader({
    required this.name,
    required this.contentBucketList,
  });

  factory ContentHeader.fromJson(Map<String, dynamic> json) =>
      _$ContentHeaderFromJson(json);
}
