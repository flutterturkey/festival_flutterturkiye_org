import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationAction extends Equatable {
  const NavigationAction({
    required this.onPressed,
    required this.title,
    required this.icon,
    required this.focusNode,
    this.pathSegmentName,
    this.isFilled = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final FocusNode focusNode;
  final bool isFilled;
  final String? pathSegmentName;

  @override
  List<Object?> get props => [
        title,
        icon,
        isFilled,
        pathSegmentName,
      ];
}
