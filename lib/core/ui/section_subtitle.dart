import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

/// It uses [Responsive Builder].
/// You do not need to make it responsive.
///
/// The font sizes for each screen sizes are:
/// - 24.0 => Small Screen
/// - 28.0 => Medium Screen
/// - 32.0 => Large Screen
class SectionSubtitle extends StatelessWidget {
  const SectionSubtitle({
    required this.title,
    this.textColor = ThemeHelper.lightColor,
    this.padding = EdgeInsets.zero,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color textColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
        smallWidget: _SectionSubtitleResponsiveText(
          title: title,
          fontSize: 24,
          textColor: textColor,
          padding: padding,
        ),
        mediumWidget: _SectionSubtitleResponsiveText(
          title: title,
          fontSize: 28,
          textColor: textColor,
          padding: padding,
        ),
        largeWidget: _SectionSubtitleResponsiveText(
          title: title,
          fontSize: 32,
          textColor: textColor,
          padding: padding,
        ),
      );
}

class _SectionSubtitleResponsiveText extends StatelessWidget {
  const _SectionSubtitleResponsiveText({
    required this.title,
    this.textColor = ThemeHelper.lightColor,
    this.padding = EdgeInsets.zero,
    this.fontSize = 36.0,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color textColor;
  final EdgeInsets padding;
  final double fontSize;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      );
}
