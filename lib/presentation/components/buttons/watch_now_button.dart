import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class WatchNowButton extends StatelessWidget {
  final VoidCallback onTap;
  const WatchNowButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              width: 1.sp,
              color: Colors.white,
            ),
            borderRadius: context.borderRadius16x,
          ),
        ),
      ),
      child: Text(
        'Hemen İzle',
        style: context.textTheme.caption!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
