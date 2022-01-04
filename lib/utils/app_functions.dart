import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class AppFunctions {
  //TODO:Padding eklenmeli
  static void showSnackBar({
    required BuildContext context,
    required String message,
    bool isSuccess = true,
  }) async {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: context.textTheme.caption!.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: !isSuccess ? Colors.red : Colors.green,
        ),
      );
  }
}
