import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    required this.title,
    required this.onPressed,
    this.isFilledButton = false,
    this.textPadding = EdgeInsets.zero,
    this.textStyle = const TextStyle(),
    this.buttonStyle = const ButtonStyle(),
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  /// If [isFilledButton] is `true`,
  /// it has a background.
  ///
  /// The background color is `ThemeHelper.appBarActionColor`
  final bool isFilledButton;
  final EdgeInsets textPadding;
  final TextStyle textStyle;
  final ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) => TextButton(
        style: buildTextButtonStyle,
        onPressed: onPressed,
        child: buildButtonTitle,
      );

  Widget get buildButtonTitle => Padding(
        padding: textPadding,
        child: Text(title, style: buildTextStyle, textAlign: TextAlign.center),
      );

  TextStyle get buildTextStyle => TextStyle(
        color: isFilledButton
            ? ThemeHelper.primaryColor
            : ThemeHelper.appBarActionColor,
        fontWeight: FontWeight.bold,
      ).merge(textStyle);

  ButtonStyle get buildTextButtonStyle =>
      buttonStyle.merge(TextButton.styleFrom(
        backgroundColor:
            isFilledButton ? ThemeHelper.appBarActionColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ));
}
