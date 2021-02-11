import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double fontSize;

  const SectionTitle(
      {@required this.title,
      this.textColor = Colors.black,
      this.padding = const EdgeInsets.symmetric(vertical: 72.0),
      this.fontSize = 48})
      : assert(title != null),
        assert(textColor != null),
        assert(padding != null),
        assert(fontSize != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
