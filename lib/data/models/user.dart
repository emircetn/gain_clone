import 'package:gain_clone/constants/app_constants.dart';
import 'package:intl/intl.dart';

class User {
  final String name;
  final String surname;
  final String email;
  final DateTime brithday;

  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.brithday,
  });

  String get shortNameAndSurname => name[0] + surname[0];

  String get nameAndSurname => '$name $surname';

  String get showBrithday =>
      '${DateFormat('dd').format(brithday)} ${AppConstants.instance.monthList[brithday.month]} ${DateFormat('yyyy').format(brithday)}';

  factory User.temp() {
    return User(
      name: 'Emir',
      surname: 'Çetin',
      email: 'emircetin98@gmail.com',
      brithday: DateTime(1998, 23, 4),
    );
  }
}
