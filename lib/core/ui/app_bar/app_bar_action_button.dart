import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:flutter/material.dart';

class AppBarActionButton extends StatelessWidget {
  const AppBarActionButton({
    @required this.title,
    @required this.onPressed,
    this.isFilledButton = false,
    Key key,
  })  : assert(title != null),
        assert(onPressed != null),
        super(key: key);

  final String title;
  final VoidCallback onPressed;
  final bool isFilledButton;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 5,
        ),
        child: TextButton(
          style: buildTextButtonStyle,
          onPressed: onPressed,
          child: buildButtonTitle,
        ),
      );

  Widget get buildButtonTitle => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Text(title, style: buildTextStyle),
      );

  TextStyle get buildTextStyle => TextStyle(
        color: isFilledButton ? Colors.black : ThemeHelper.appBarActionColor,
        fontWeight: FontWeight.bold,
      );

  ButtonStyle get buildTextButtonStyle => TextButton.styleFrom(
        backgroundColor:
            isFilledButton ? ThemeHelper.appBarActionColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
