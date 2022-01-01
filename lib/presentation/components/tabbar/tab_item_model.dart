import 'package:flutter/material.dart';

class TabItemModel {
  final String text;
  final IconData icon;
  final Widget child;

  const TabItemModel({
    required this.text,
    required this.icon,
    required this.child,
  });
}
