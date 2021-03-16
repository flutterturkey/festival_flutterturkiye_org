import 'package:flutter/material.dart';

class AppBarAndDrawerItem {
  AppBarAndDrawerItem(
    this.title,
    this.icon,
    this.onPressed, {
    this.isFilled,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isFilled;
}
