import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class CircleIconButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

  const CircleIconButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: context.padding12x,
        child: Column(
          children: [
            Icon(
              iconData,
              size: 24.sp,
            ),
            SizedBox(height: 6.sp),
            Text(
              text,
              style: context.textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
