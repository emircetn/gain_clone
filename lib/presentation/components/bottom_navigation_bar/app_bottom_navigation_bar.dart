import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gain_clone/extensions/app_extensions.dart';
import 'package:gain_clone/presentation/components/bottom_navigation_bar/app_bottom_navigation_item_model.dart';
import 'package:gain_clone/presentation/components/bottom_navigation_bar/app_bottom_navigation_bar_item_widget.dart';

typedef AppBottomNavigationBarCallBack = void Function(int);

class AppBottomNavigationBar extends StatelessWidget {
  final List<AppBottomNavigationBarItemModel> items;
  final int selectedIndex;
  final AppBottomNavigationBarCallBack tabChanged;

  const AppBottomNavigationBar({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.tabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: context.paddingHorizontal16x + context.paddingBottom16x,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: context.borderRadius32x,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                items.length,
                (index) => Expanded(
                  child: AppBottomNavigationBarItemWidget(
                    context: context,
                    text: items[index].text,
                    iconData: items[index].icon,
                    onTap: () {
                      if (selectedIndex == index) return;
                      tabChanged(index);
                    },
                    isSelected: selectedIndex == index,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
