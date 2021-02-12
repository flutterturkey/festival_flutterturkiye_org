import 'package:festival_flutterturkiye_org/core/model/session_model.dart';
import 'package:flutter/material.dart';
import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';

class EventFlowSessionText extends StatelessWidget {
  const EventFlowSessionText({
    Key key,
    @required this.text,
    this.sessionStatus = SessionStatus.waiting,
  })  : assert(text != null),
        assert(sessionStatus != null),
        super(key: key);

  final String text;
  final SessionStatus sessionStatus;

  @override
  Widget build(BuildContext context) {
    Color textColor;
    double fontSize;
    FontWeight fontWeight;

    switch (sessionStatus) {
      case SessionStatus.active:
        textColor = ThemeHelper.eventPointColor;
        fontSize = 20.0;
        fontWeight = FontWeight.bold;
        break;
      case SessionStatus.passed:
        textColor = ThemeHelper.footerTextColor;
        fontSize = 16.0;
        fontWeight = FontWeight.normal;
        break;
      case SessionStatus.waiting:
      default:
        textColor = ThemeHelper.lightColor;
        fontSize = 16.0;
        fontWeight = FontWeight.w500;
    }

    return Text(
      text,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
