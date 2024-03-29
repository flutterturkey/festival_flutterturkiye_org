import 'package:flutter/material.dart';

class ThemeHelper {
  ThemeHelper._();

  static const Color primaryColor = Color(0xFF072349);
  static const Color darkColor = Color(0xFF212937);
  static const Color lightColor = Color(0xFFFFFFFF);
  static const Color blueColor = Color(0xFF07C6F9);
  static const Color activityFlowColor = Color(0xFFF2F2F2);
  static const Color eventPointColor = Color(0xFFFF9B05);
  static const Color speakerDetailImageBorder = Color(0xFFFF7A00);
  static const Color cardBackgroundColor = Color(0xFF1C1C1D);
  static const Color appBarActionColor = Color(0xFFF2F2F2);

  static const Brightness brightness = Brightness.light;

  static final ThemeData themeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    secondaryHeaderColor: lightColor,
    primaryColor: primaryColor,
    canvasColor: primaryColor,
    brightness: brightness,
    fontFamily: 'Manrope',
    buttonTheme: const ButtonThemeData(
      buttonColor: lightColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
