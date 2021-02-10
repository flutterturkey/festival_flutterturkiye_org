import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';

class SpeakerDetailSubText extends StatelessWidget {
  const SpeakerDetailSubText({
    Key key,
    @required this.text,
    this.textColor = ThemeHelper.lightColor,
    this.fontWeight = FontWeight.w300,
  })  : assert(text != null),
        assert(textColor != null),
        assert(fontWeight != null),
        super(key: key);

  final String text;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: 22.0,
      ),
    );
  }
}
