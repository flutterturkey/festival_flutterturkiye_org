import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:flutter/material.dart';

class EventFlowSessionPoint extends StatelessWidget {
  const EventFlowSessionPoint({
    @required this.sessionStatus,
    Key key,
  })  : assert(sessionStatus != null),
        super(key: key);
  final SessionStatus sessionStatus;

  @override
  Widget build(BuildContext context) {
    Color pointColor;
    double radius;

    switch (sessionStatus) {
      case SessionStatus.active:
        pointColor = ThemeHelper.eventPointColor;
        radius = 28.0;
        break;
      case SessionStatus.passed:
        pointColor = ThemeHelper.appBarActionColor;
        radius = 20.0;
        break;
      case SessionStatus.waiting:
      default:
        pointColor = ThemeHelper.blueColor;
        radius = 20.0;
        break;
    }
    return Container(
      height: radius,
      width: radius,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(shape: BoxShape.circle, color: pointColor),
    );
  }
}
