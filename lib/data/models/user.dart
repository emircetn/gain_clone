import 'package:intl/intl.dart';

import 'package:gain_clone/constants/app_constants.dart';

class User {
  final String nameAndSurname;
  final String email;
  final DateTime brithday;
  bool? isHaveEMessagePermission;
  bool? isOpenDataSavingMode;

  User({
    required this.nameAndSurname,
    required this.email,
    required this.brithday,
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
    final bool? isHaveEMessagePermission,
    final bool? isOpenDataSavingMode,
  }) {
    return User(
      nameAndSurname: nameAndSurname ?? 'Emir Çetin',
      email: email ?? 'emircetin98@gmail.com',
      brithday: brithday ?? DateTime(1998, 23, 4),
      isHaveEMessagePermission: isHaveEMessagePermission,
      isOpenDataSavingMode: isOpenDataSavingMode,
    );
  }

  User copyWith({
    String? nameAndSurname,
    String? email,
    DateTime? brithday,
    bool? isHaveEMessagePermission,
    bool? isOpenDataSavingMode,
  }) {
    return User(
      nameAndSurname: nameAndSurname ?? this.nameAndSurname,
      email: email ?? this.email,
      brithday: brithday ?? this.brithday,
      isHaveEMessagePermission:
          isHaveEMessagePermission ?? this.isHaveEMessagePermission,
      isOpenDataSavingMode: isOpenDataSavingMode ?? this.isOpenDataSavingMode,
    );
  }
}
