import 'package:flutter/material.dart';

class NavigationAction {
  NavigationAction(
    this.title,
    this.icon,
    this.onPressed, {
    this.isFilled = false,
  })  : assert(title != null),
        assert(icon != null),
        assert(onPressed != null),
        assert(isFilled != null);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isFilled;
}
