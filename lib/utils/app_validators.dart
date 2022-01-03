import 'package:gain_clone/constants/app_constants.dart';

class AppValidators {
  static AppValidators? _instace;
  static AppValidators get instance {
    _instace ??= AppValidators._init();
    return _instace!;
  }

  AppValidators._init();

  AppConstants appConstants = AppConstants.instance;

  String? nameAndSurnameCheck(
      String? nameAndSurname, String? lastNameAndSurname) {
    if (nameAndSurname == null ||
        nameAndSurname.length < appConstants.minimumUserNameCount) {
      return 'Ad soyad bu kadar kısa olamaz';
    } else if (nameAndSurname == lastNameAndSurname) {
      return 'Ad soyad öncekiyle aynı';
    } else {
      return null;
    }
  }

  RegExp get birtdayRegExp =>
      RegExp((r'^((0[1-9]|[12]\d|3[01])\/(0[1-9]|1[0-2])\/[12]\d{3})'));

  String? brithdayCheck(String? birthday, String? lastBirthday) {
    if (birthday == null || !birtdayRegExp.hasMatch(birthday)) {
      return 'Lütfen geçerli bir doğum tarihi giriniz';
    } else if (birthday == lastBirthday) {
      return 'Doğum tarihi  öncekiyle aynı';
    } else {
      return null;
    }
  }

  String? passwordCheck1(String? password1) {
    if (password1 == null || password1.isEmpty) {
      return 'Lütfen bir parola gir';
    } else if (password1.contains(' ')) {
      return 'Parola boşluk içeremez';
    } else if (password1.length < 6) {
      return 'Parola en az 6 karakter olabilir';
    } else if (password1.length > 25) {
      return 'Parola en fazla 25 karakter olabilir';
    } else {
      return null;
    }
  }

  String? emailCheck(String? email) {
    if (email == null) {
      return 'Lütfen e-posta adresi gir';
    }
    if (RegExp(r'^(\S+@\S+\.\S+$)').hasMatch(email)) {
      return null;
    }
    return 'E-posta adresi geçersiz';
  }
}
