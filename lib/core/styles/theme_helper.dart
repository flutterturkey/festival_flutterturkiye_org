import 'package:flutter/material.dart';

class ThemeHelper {
  static const Color darkColor = Color(0xFF1C1C1D);
  static const Color lightColor = Color(0xFFFFFFFF);
  static const Color lightBlueColor = Color(0xFF07C6F9);
  static const Color activityFlowColor = Color(0xFFF2F2F2);
  static const Color eventPointColor = Color(0xFFFF9B05);
  static const Color eventFlowColor = Color(0xFF212937);
  static const Color footerTextColor = Color(0xFFD9DBE1);
  static const Brightness brightness = Brightness.light;

  static final ThemeData themeData = ThemeData(
    accentColor: lightColor,
    primaryColor: darkColor,
    brightness: brightness,
    appBarTheme: const AppBarTheme(
      color: darkColor,
      centerTitle: false,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: lightColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
