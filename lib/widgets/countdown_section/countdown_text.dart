import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class CountdownText extends StatelessWidget {
  const CountdownText({
    @required this.textSpans,
    @required this.fontSize,
    this.textAlign = TextAlign.center,
    Key key,
  })  : assert(textSpans != null),
        assert(textAlign != null),
        assert(fontSize != null),
        super(key: key);

  final List<TextSpan> textSpans;
  final TextAlign textAlign;
  final double fontSize;

  @override
  Widget build(BuildContext context) => RichText(
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
