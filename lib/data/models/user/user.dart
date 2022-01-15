import 'package:intl/intl.dart';

import 'package:gain_clone/constants/app_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String nameAndSurname;
  final String email;
  final DateTime brithday;
  final String? profileURL;
  @JsonKey(ignore: true)
  bool? isHaveEMessagePermission;
  @JsonKey(ignore: true)
  bool? isOpenDataSavingMode;

  User({
    required this.nameAndSurname,
    required this.email,
    required this.brithday,
    this.profileURL,
    this.isHaveEMessagePermission,
    this.isOpenDataSavingMode,
  });

  String get shortNameAndSurname => nameAndSurname.split(' ').length > 1
      ? nameAndSurname.split(' ').first[0] + nameAndSurname.split(' ').last[0]
      : nameAndSurname.split(' ').first[0];

  String get showBrithday =>
      '${DateFormat('dd').format(brithday)} ${AppConstants.instance.monthList[brithday.month - 1]} ${DateFormat('yyyy').format(brithday)}';

  String get brithdayWithFormat => DateFormat('dd/MM/yyy').format(brithday);

  factory User.temp({
    final String? nameAndSurname,
    final String? email,
    final DateTime? brithday,
    final String? profileURL,
    final bool? isHaveEMessagePermission,
    final bool? isOpenDataSavingMode,
  }) {
    return User(
      nameAndSurname: nameAndSurname ?? 'Emir Çetin',
      email: email ?? 'emircetin98@gmail.com',
      brithday: brithday ?? DateTime(1998, 23, 4),
      profileURL: profileURL,
      isHaveEMessagePermission: isHaveEMessagePermission,
      isOpenDataSavingMode: isOpenDataSavingMode,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? nameAndSurname,
    String? email,
    DateTime? brithday,
    final String? profileURL,
    bool? isHaveEMessagePermission,
    bool? isOpenDataSavingMode,
  }) {
    return User(
      nameAndSurname: nameAndSurname ?? this.nameAndSurname,
      email: email ?? this.email,
      brithday: brithday ?? this.brithday,
      profileURL: profileURL ?? this.profileURL,
      isHaveEMessagePermission:
          isHaveEMessagePermission ?? this.isHaveEMessagePermission,
      isOpenDataSavingMode: isOpenDataSavingMode ?? this.isOpenDataSavingMode,
    );
  }
}
