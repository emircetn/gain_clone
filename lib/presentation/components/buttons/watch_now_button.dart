import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class WatchNowButton extends StatelessWidget {
  final VoidCallback onPressed;
  const WatchNowButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: context.borderRadius24x,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: context.paddingRight4x,
              child: const Icon(
                Icons.play_arrow,
                size: 20,
              ),
            ),
            Text(
              'Hemen İzle',
              style: context.textTheme.subtitle2!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: context.paddingRight4x,
              child: const Icon(
                Icons.play_arrow,
                size: 20,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
