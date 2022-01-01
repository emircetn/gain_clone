import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class UserInfoTile extends ListTile {
  UserInfoTile({
    Key? key,
    required BuildContext context,
    required final String header,
    required final String text,
    final VoidCallback? onTap,
  }) : super(
          key: key,
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          title: Text(
            header,
            style: context.textTheme.caption!.copyWith(
              color: Colors.white24,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            text,
            style: context.textTheme.caption!.copyWith(color: Colors.white),
          ),
        );
}
