// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      id: json['id'] as int,
      name: json['name'] as String,
      explanation: json['explanation'] as String,
      contentType: $enumDecode(_$ContentTypesEnumMap, json['contentType']),
      coverImageUrl: json['coverImageUrl'] as String,
      partCount: json['partCount'] as int? ?? 1,
      videoUrl: json['videoUrl'] as String? ??
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      imdbScore: (json['imdbScore'] as num?)?.toDouble(),
    );

const _$ContentTypesEnumMap = {
  ContentTypes.series: 0,
  ContentTypes.movie: 1,
  ContentTypes.program: 2,
  ContentTypes.documentary: 3,
};
