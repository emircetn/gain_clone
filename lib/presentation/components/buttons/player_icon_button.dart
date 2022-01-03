import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class PlayerIconButton extends IconButton {
  PlayerIconButton({
    Key? key,
    required final IconData iconData,
    required final VoidCallback? onPressed,
  }) : super(
          key: key,
          icon: Icon(iconData, size: 24.sp),
          onPressed: onPressed,
        );
}
