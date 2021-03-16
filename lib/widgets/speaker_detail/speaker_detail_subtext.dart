import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:flutter/material.dart';

class SpeakerDetailSubText extends StatelessWidget {
  const SpeakerDetailSubText({
    @required this.text,
    this.textColor = ThemeHelper.lightColor,
    this.fontWeight = FontWeight.w300,
    Key key,
  })  : assert(text != null),
        assert(textColor != null),
        assert(fontWeight != null),
        super(key: key);

  final String text;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: fontWeight,
          fontSize: 22,
        ),
      );
}
