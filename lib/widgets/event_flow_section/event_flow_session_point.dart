import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/widgets/event_flow_section/sessions_widget.dart';

class EventFlowSessionPoint extends StatelessWidget {
  final SessionStatus sessionStatus;

  const EventFlowSessionPoint({Key key, @required this.sessionStatus})
      : assert(sessionStatus != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    Color pointColor;
    double radius;

    switch (sessionStatus) {
      case SessionStatus.active:
        pointColor = ThemeHelper.lightColor;
        radius = 12.0;
        break;
      case SessionStatus.passed:
        pointColor = ThemeHelper.appBarActionColor;
        radius = 8.0;
        break;
      case SessionStatus.waiting:
      default:
        pointColor = ThemeHelper.eventPointColor;
        radius = 8.0;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: pointColor,
      ),
    );
  }
}
