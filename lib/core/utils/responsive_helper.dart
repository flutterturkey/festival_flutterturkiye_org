import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double mediumWidth = 768;
  static const double largeWidth = 1200;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumWidth;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumWidth &&
      MediaQuery.of(context).size.width < largeWidth;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeWidth;
}
