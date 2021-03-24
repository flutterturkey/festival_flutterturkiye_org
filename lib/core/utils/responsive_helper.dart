import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double mediumWidth = 500;
  static const double largeWidth = 1000;

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumWidth;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumWidth &&
      MediaQuery.of(context).size.width < largeWidth;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeWidth;
}
