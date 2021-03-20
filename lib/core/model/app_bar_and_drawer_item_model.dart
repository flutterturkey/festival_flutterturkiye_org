import 'package:flutter/material.dart';

class DrawerItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const DrawerItemModel(
    this.title,
    this.icon,
    this.onPressed,
  );
}
