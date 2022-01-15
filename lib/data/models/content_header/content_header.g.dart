// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentHeader _$ContentHeaderFromJson(Map<String, dynamic> json) =>
    ContentHeader(
      name: json['name'] as String,
      contentBucketList: (json['contentBuckect'] as List<dynamic>)
          .map((e) => ContentBucket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
