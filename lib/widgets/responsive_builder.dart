import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/utils/responsive_helper.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    Key key,
    @required this.mobile,
    this.tablet,
    @required this.desktop,
  })  : assert(mobile != null, 'Mobile cannot be empty.'),
        assert(desktop != null, 'Desktop cannot be empty.'),
        super(key: key);

  /// 0px - 799px
  final Widget mobile;

  /// 800px - 1199px
  final Widget tablet;

  /// 1200px
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= ResponsiveHelper.mediumWidth) {
          return desktop;
        } else if (constraints.maxWidth >= ResponsiveHelper.largeWidth) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
