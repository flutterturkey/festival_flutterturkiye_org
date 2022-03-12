import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

const double _fontSizeSmall = 40;
const double _fontSizeMedium = 56;
const double _fontSizeLarge = 72;

class CountdownTextBuilder extends StatelessWidget {
  const CountdownTextBuilder({
    required this.textSpans,
    this.fontWeight = FontWeight.normal,
    Key? key,
  }) : super(key: key);

  final List<InlineSpan> textSpans;
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
    required this.textSpans,
    required this.fontSize,
    this.textAlign = TextAlign.center,
    Key? key,
  }) : super(key: key);

  final List<InlineSpan> textSpans;
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
