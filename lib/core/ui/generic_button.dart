import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    @required this.title,
    @required this.onPressed,
    this.isFilledButton = false,
    this.textPadding = EdgeInsets.zero,
    this.textStyle = const TextStyle(),
    Key key,
  })  : assert(title != null),
        assert(onPressed != null),
        assert(textPadding != null),
        assert(textStyle != null),
        super(key: key);

  final String title;
  final VoidCallback onPressed;

  /// If [isFilledButton] is `true`,
  /// it has a background.
  ///
  /// The background color is `ThemeHelper.appBarActionColor`
  final bool isFilledButton;
  final EdgeInsets textPadding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) => TextButton(
        style: buildTextButtonStyle,
        onPressed: onPressed,
        child: buildButtonTitle,
      );

  Widget get buildButtonTitle => Padding(
        padding: textPadding,
        child: Text(title, style: buildTextStyle),
      );

  TextStyle get buildTextStyle => TextStyle(
        color: isFilledButton ? Colors.black : ThemeHelper.appBarActionColor,
        fontWeight: FontWeight.bold,
      ).merge(textStyle);

  ButtonStyle get buildTextButtonStyle => TextButton.styleFrom(
        backgroundColor:
            isFilledButton ? ThemeHelper.appBarActionColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
