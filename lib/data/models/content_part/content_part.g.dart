// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentPart _$ContentPartFromJson(Map<String, dynamic> json) => ContentPart(
      part: json['part'] as int?,
      contentName: json['name'] as String,
      partName: json['partName'] as String?,
      coverUrl: json['coverUrl'] as String,
      videoUrl: json['videoUrl'] as String? ??
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      videoAspectRatio: (json['videoAspectRatio'] as num?)?.toDouble() ?? 1.7,
      explanation: json['explanation'] as String,
    );
