import 'package:flutter/material.dart';
import 'package:gain_clone/extensions/app_extensions.dart';

class ContentTypesTabbar extends TabBar {
  ContentTypesTabbar({
    Key? key,
    required final BuildContext context,
    final TabController? controller,
    required final List<String> tabs,
  }) : super(
          key: key,
          labelPadding: context.paddingHorizontal12x,
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
          controller: controller,
          unselectedLabelColor: Colors.white54,
          labelStyle: context.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
          ),
          isScrollable: true,
          indicatorPadding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          indicatorWeight: 0.01,
        );
}
