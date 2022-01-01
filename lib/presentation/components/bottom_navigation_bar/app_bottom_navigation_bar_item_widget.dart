import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class AppBottomNavigationBarItemWidget extends Material {
  AppBottomNavigationBarItemWidget({
    Key? key,
    required BuildContext context,
    required final IconData iconData,
    required final VoidCallback onTap,
    required String text,
    required bool isSelected,
  }) : super(
          key: key,
          color: Colors.transparent,
          child: Tooltip(
            message: text,
            textStyle: context.textTheme.caption!.copyWith(
              fontSize: 9.sp,
              color: Colors.white,
            ),
            child: IconButton(
              splashRadius: 30.sp,
              padding: context.padding8x,
              iconSize: 20.sp,
              onPressed: onTap,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: 18.sp,
                    color: Colors.white.withOpacity(isSelected ? 1 : 0.6),
                  ),
                  SizedBox(
                    height: 4.sp,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: context.textTheme.caption!.copyWith(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(isSelected ? 1 : 0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
