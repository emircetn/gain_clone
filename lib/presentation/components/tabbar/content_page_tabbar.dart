import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class ContentPageTabbar extends TabBar {
  ContentPageTabbar({
    Key? key,
    required final BuildContext context,
    final TabController? controller,
    required final List<String> tabs,
    required final Function(int) onPageChanged,
  }) : super(
          key: key,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          controller: controller,
          unselectedLabelColor: Colors.white54,
          labelStyle: context.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
          ),
          onTap: onPageChanged,
          indicatorPadding: EdgeInsets.zero,
          indicatorColor: Colors.red,
          indicatorWeight: 2.sp,
        );
}
