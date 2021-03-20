import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

const double _kFontSizeSmall = 24;
const double _kFontSizeMedium = 48;
const double _kFontSizeLarge = 72;

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
          fontSize: _kFontSizeSmall,
        ),
        mediumWidget: _CountdownText(
          textSpans: textSpans,
          fontSize: _kFontSizeMedium,
        ),
        largeWidget: _CountdownText(
          textSpans: textSpans,
          fontSize: _kFontSizeLarge,
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
