import 'package:flutter/material.dart';

class AppBarAndDrawerItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isFilled;

  AppBarAndDrawerItemModel(this.title, this.icon, this.onPressed,
      {this.isFilled});
}
