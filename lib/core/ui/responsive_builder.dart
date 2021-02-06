import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/responsive_helper.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key key,
    @required this.smallWidget,
    this.mediumWidget,
    @required this.largeWidget,
  })  : assert(smallWidget != null, 'Small Widget cannot be empty.'),
        assert(largeWidget != null, 'Large Widget cannot be empty.'),
        super(key: key);

  /// It can displayable on [small] screens.
  final Widget smallWidget;

  /// It can displayable on [medium] screens.
  final Widget mediumWidget;

  /// It can displayable on [large] screens.
  final Widget largeWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ResponsiveHelper.mediumWidth) {
          return largeWidget;
        } else if (constraints.maxWidth >= ResponsiveHelper.largeWidth) {
          return mediumWidget ?? smallWidget;
        } else {
          return smallWidget;
        }
      },
    );
  }
}
