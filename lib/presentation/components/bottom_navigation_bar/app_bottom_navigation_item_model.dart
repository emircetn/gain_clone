import 'package:flutter/material.dart';

class AppBottomNavigationBarItemModel {
  final String text;
  final IconData icon;
  final Widget page;

  const AppBottomNavigationBarItemModel({
    required this.text,
    required this.icon,
    required this.page,
  });
}
