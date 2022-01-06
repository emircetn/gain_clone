import 'package:gain_clone/data/models/content_bucket.dart';

class ContentHeader {
  final String name;
  final List<ContentBucket> contentBucketList;

  ContentHeader({
    required this.name,
    required this.contentBucketList,
  });

  factory ContentHeader.fromMap(Map<String, dynamic> map) {
    return ContentHeader(
      name: map['name'] ?? '',
      contentBucketList: List<ContentBucket>.from(
        map['contentBuckect']?.map(
          (x) => ContentBucket.fromMap(x),
        ),
      ).cast<ContentBucket>(),
    );
  }
}
