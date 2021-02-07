import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color textColor;

  const SectionTitle({
    @required this.title,
    this.textColor = Colors.black,
  })  : assert(title != null),
        assert(textColor != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 70.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 48,
          color: textColor,
        ),
      ),
    );
  }
}
