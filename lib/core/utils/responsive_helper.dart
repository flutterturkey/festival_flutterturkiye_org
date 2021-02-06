import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double tabletMinWidth = 800;
  static const double desktopMinWidth = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletMinWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletMinWidth &&
      MediaQuery.of(context).size.width < desktopMinWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopMinWidth;
}
