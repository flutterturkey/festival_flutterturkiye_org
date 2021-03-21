import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

const double _fontSizeSmall = 40;
const double _fontSizeMedium = 56;
const double _fontSizeLarge = 72;

class CountdownTextBuilder extends StatelessWidget {
  CountdownTextBuilder({
    @required this.textSpans,
    this.fontWeight = FontWeight.normal,
    Key key,
  })  : assert(textSpans != null),
        assert(textSpans.isNotEmpty),
        assert(fontWeight != null),
        super(key: key);

  final List<TextSpan> textSpans;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
        smallWidget: _CountdownText(
          textSpans: textSpans,
          fontSize: _fontSizeSmall,
        ),
        mediumWidget: _CountdownText(
          textSpans: textSpans,
          fontSize: _fontSizeMedium,
        ),
        largeWidget: _CountdownText(
          textSpans: textSpans,
          fontSize: _fontSizeLarge,
        ),
      );
}

class _CountdownText extends StatelessWidget {
  const _CountdownText({
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
