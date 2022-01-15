// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      nameAndSurname: json['nameAndSurname'] as String,
      email: json['email'] as String,
      brithday: DateTime.parse(json['brithday'] as String),
      profileURL: json['profileURL'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nameAndSurname': instance.nameAndSurname,
      'email': instance.email,
      'brithday': instance.brithday.toIso8601String(),
      'profileURL': instance.profileURL,
    };
