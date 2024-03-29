import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class EventFlowSessionText extends StatelessWidget {
  const EventFlowSessionText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.sessionStatus = SessionStatus.waiting,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextAlign textAlign;
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
        textColor = ThemeHelper.lightColor;
        fontSize = 16.0;
        fontWeight = FontWeight.normal;
        break;
      case SessionStatus.waiting:
      default:
        textColor = ThemeHelper.lightColor;
        fontSize = 16.0;
        fontWeight = FontWeight.w500;
    }

    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: textAlign,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
