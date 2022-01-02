class User {
  final String name;
  final String surname;
  final String email;

  User({
    required this.name,
    required this.surname,
    required this.email,
  });

  String get shortNameAndSurname => name[0] + surname[0];

  String get nameAndSurname => '$name $surname';

  factory User.temp() {
    return User(
      name: 'Emir',
      surname: 'Çetin',
      email: 'emircetin98@gmail.com',
    );
  }
}
