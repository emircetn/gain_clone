import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class AppTabbar extends TabBar {
  AppTabbar({
    Key? key,
    required final BuildContext context,
    final TabController? controller,
    required final List<String> tabs,
  }) : super(
          key: key,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          controller: controller,
          unselectedLabelColor: Colors.white54,
          labelStyle: context.textTheme.bodyText1,
          isScrollable: true,
          indicatorPadding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          indicatorWeight: 0.01,
        );
}
