import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

typedef ButtonCallBack = Future<void> Function();

class AppAsyncButton extends StatefulWidget {
  final String text;
  final ButtonCallBack futureFunction;

  const AppAsyncButton({
    Key? key,
    required this.text,
    required this.futureFunction,
  }) : super(key: key);

  @override
  _AppAsyncButtonState createState() => _AppAsyncButtonState();
}

class _AppAsyncButtonState extends State<AppAsyncButton> {
  ValueNotifier<bool> isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isLoadingNotifier.dispose();
    super.dispose();
  }

  void onTap() async {
    try {
      isLoadingNotifier.value = true;
      await widget.futureFunction();
    } finally {
      isLoadingNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 40,
      child: ValueListenableBuilder<bool>(
        valueListenable: isLoadingNotifier,
        builder: (context, isLoading, _) {
          return ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: context.borderRadius16x,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: isLoading ? null : onTap,
            child: !isLoading
                ? Text(widget.text)
                : const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
