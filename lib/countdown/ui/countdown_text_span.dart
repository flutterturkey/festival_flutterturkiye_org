import 'package:flutter/material.dart';

class CountdownTextSpan extends TextSpan {
  /// If you give a [TextStyle], it will override the [FontWeight]
  ///
  /// Default [FontWeight] is `FontWeight.normal`
  CountdownTextSpan(
    String text, {
    TextStyle? style,
    FontWeight fontWeight = FontWeight.normal,
  }) : super(text: text, style: style ?? TextStyle(fontWeight: fontWeight));
}
