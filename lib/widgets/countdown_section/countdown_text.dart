import 'package:flutter/material.dart';
import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';

class CountdownText extends StatelessWidget {
  const CountdownText({
    Key key,
    @required this.textSpans,
    this.textAlign = TextAlign.center,
    @required this.fontSize,
  })  : assert(textSpans != null),
        assert(textAlign != null),
        assert(fontSize != null),
        super(key: key);

  final List<TextSpan> textSpans;
  final TextAlign textAlign;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: textSpans,
        style: TextStyle(
          color: ThemeHelper.lightColor,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
