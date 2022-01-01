import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class MiniWatchNowButton extends ElevatedButton {
  MiniWatchNowButton({
    Key? key,
    required BuildContext context,
    required final VoidCallback onTap,
  }) : super(
          key: key,
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
