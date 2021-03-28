import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    @required this.title,
    this.textColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(vertical: 48),
    this.fontSize = 48,
    this.textAlign = TextAlign.center,
    Key key,
  })  : assert(title != null),
        assert(textColor != null),
        assert(padding != null),
        assert(fontSize != null),
        assert(textAlign != null),
        super(key: key);

  final String title;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      );
}
