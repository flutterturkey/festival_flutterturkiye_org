import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    @required this.title,
    this.textColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(vertical: 48),
    this.fontSize = 48,
    Key key,
  })  : assert(title != null),
        assert(textColor != null),
        assert(padding != null),
        assert(fontSize != null),
        super(key: key);

  final String title;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Padding(
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
