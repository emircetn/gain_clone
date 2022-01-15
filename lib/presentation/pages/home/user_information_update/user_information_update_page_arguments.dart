import 'package:flutter/services.dart';

typedef UserInformationUpdateCallBack = Future<bool> Function(String text);

class UserInformationUpdatePageArguments {
  final String text;
  final String initialValue;
  final String? Function(String?, String?) validatorFunction;
  final UserInformationUpdateCallBack buttonCallBack;
  List<TextInputFormatter>? inputFormatters;

  UserInformationUpdatePageArguments({
    required this.text,
    required this.initialValue,
    required this.validatorFunction,
    required this.buttonCallBack,
    this.inputFormatters,
  });
}
