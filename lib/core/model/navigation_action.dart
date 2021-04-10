import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationAction extends Equatable {
  const NavigationAction({
    @required this.title,
    @required this.icon,
    @required this.onPressed,
    this.isFilled = false,
  })  : assert(title != null),
        assert(icon != null),
        assert(onPressed != null);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isFilled;

  @override
  List<Object> get props => [
        title,
        icon,
        isFilled,
      ];
}
