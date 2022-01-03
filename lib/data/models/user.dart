import 'package:gain_clone/constants/app_constants.dart';
import 'package:intl/intl.dart';

class User {
  final String nameAndSurname;
  final String email;
  final DateTime brithday;

  User({
    required this.nameAndSurname,
    required this.email,
    required this.brithday,
  });

  String get shortNameAndSurname => nameAndSurname.split(' ').length > 1
      ? nameAndSurname.split(' ').first[0] + nameAndSurname.split(' ').last[0]
      : nameAndSurname.split(' ').first[0];

  String get showBrithday =>
      '${DateFormat('dd').format(brithday)} ${AppConstants.instance.monthList[brithday.month]} ${DateFormat('yyyy').format(brithday)}';

  factory User.temp([
    String? nameAndSurname,
  ]) {
    return User(
      nameAndSurname: nameAndSurname ?? 'Emir Çetin',
      email: 'emircetin98@gmail.com',
      brithday: DateTime(1998, 23, 4),
    );
  }
}
