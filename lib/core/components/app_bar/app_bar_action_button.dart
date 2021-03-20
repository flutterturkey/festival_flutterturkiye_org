import 'package:flutter/material.dart';
import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';

class AppBarActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isFilledButton;

  const AppBarActionButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.isFilledButton = false,
  })  : assert(title != null),
        assert(onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextButton(
        child: buildButtonTitle,
        style: buildTextButtonStyle,
        onPressed: onPressed,
      ),
    );
  }

  Widget get buildButtonTitle {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      child: Text('$title', style: buildTextStyle),
    );
  }

  TextStyle get buildTextStyle {
    return TextStyle(
      color: isFilledButton ? Colors.black : ThemeHelper.appBarActionColor,
      fontWeight: FontWeight.bold,
    );
  }

  ButtonStyle get buildTextButtonStyle {
    return TextButton.styleFrom(
      backgroundColor:
          isFilledButton ? ThemeHelper.appBarActionColor : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
