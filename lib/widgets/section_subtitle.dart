import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

/// It uses [Responsive Builder].
/// You do not need to make it responsive.
///
/// The font sizes for each screen sizes are:
/// - 24.0 => Small Screen
/// - 28.0 => Medium Screen
/// - 32.0 => Large Screen
class SectionSubtitle extends StatelessWidget {
  final String title;
  final Color textColor;
  final EdgeInsets padding;

  const SectionSubtitle({
    @required this.title,
    this.textColor = ThemeHelper.lightColor,
    this.padding = EdgeInsets.zero,
  })  : assert(title != null),
        assert(textColor != null),
        assert(padding != null);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      smallWidget: _SectionSubtitleResponsiveText(
        title: title,
        fontSize: 24.0,
        textColor: textColor,
        padding: padding,
      ),
      mediumWidget: _SectionSubtitleResponsiveText(
        title: title,
        fontSize: 28.0,
        textColor: textColor,
        padding: padding,
      ),
      largeWidget: _SectionSubtitleResponsiveText(
        title: title,
        fontSize: 32.0,
        textColor: textColor,
        padding: padding,
      ),
    );
  }
}

class _SectionSubtitleResponsiveText extends StatelessWidget {
  final String title;
  final Color textColor;
  final EdgeInsets padding;
  final double fontSize;

  const _SectionSubtitleResponsiveText({
    @required this.title,
    this.textColor = ThemeHelper.lightColor,
    this.padding = EdgeInsets.zero,
    this.fontSize = 36.0,
  })  : assert(title != null),
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
          fontSize: fontSize,
          color: textColor,
        ),
      ),
    );
  }
}
