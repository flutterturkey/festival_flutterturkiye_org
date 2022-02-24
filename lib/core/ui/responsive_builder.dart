import 'package:festival_flutterturkiye_org/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.smallWidget,
    required this.largeWidget,
    required this.mediumWidget,
    Key? key,
  }) : super(key: key);

  /// It can displayable on small screens.
  final Widget smallWidget;

  /// It can displayable on medium screens.
  final Widget mediumWidget;

  /// It can displayable on large screens.
  final Widget largeWidget;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= ResponsiveHelper.largeWidth) {
            return largeWidget;
          } else if (constraints.maxWidth >= ResponsiveHelper.mediumWidth) {
            return mediumWidget;
          } else {
            return smallWidget;
          }
        },
      );
}
