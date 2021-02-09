import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/widgets/event_flow_section/sessions_widget.dart';
import 'package:hackathon_flutterturkiye_org/widgets/section_subtitle.dart';
import 'package:hackathon_flutterturkiye_org/widgets/section_title.dart';

class EventFlowSection extends StatelessWidget {
  const EventFlowSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeHelper.darkColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionTitle(
            title: 'Etkinlik Programı',
            textColor: ThemeHelper.lightColor,
          ),
          const SectionSubtitle(
            title: '6 Mart Cumartesi',
            padding: EdgeInsets.only(bottom: 16.0),
          ),
          const SessionsWidget(),
        ],
      ),
    );
  }
}
