import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class AppAlert extends StatelessWidget {
  final String titleText;
  final String contentText;
  final String nextText;
  final String? cancelText;
  final Function()? nextTextOnPressed;
  final bool barrierDismissible;

  const AppAlert({
    Key? key,
    required this.titleText,
    required this.contentText,
    required this.nextText,
    this.cancelText,
    this.nextTextOnPressed,
    this.barrierDismissible = true,
  }) : super(key: key);

  Future<bool?> show(BuildContext context) async {
    return await showDialog<bool>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => barrierDismissible,
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: Text(
          contentText,
          style: context.textTheme.subtitle2!.copyWith(color: Colors.black),
        ),
        title: Text(
          titleText,
          style: context.textTheme.bodyText1!.copyWith(color: Colors.black),
        ),
        actions: [
          if (cancelText != null) ...[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                cancelText!,
                style: context.textTheme.caption!.copyWith(color: Colors.black),
              ),
            ),
          ],
          TextButton(
            onPressed: () {
              if (nextTextOnPressed != null) {
                nextTextOnPressed!();
              }
              Navigator.of(context).pop(true);
            },
            child: Text(
              nextText,
              style: context.textTheme.caption!.copyWith(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
