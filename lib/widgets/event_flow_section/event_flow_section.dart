import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/sessions_widget.dart';
import 'package:festival_flutterturkiye_org/widgets/section_subtitle.dart';
import 'package:festival_flutterturkiye_org/widgets/section_title.dart';
import 'package:flutter/material.dart';

class EventFlowSection extends StatelessWidget {
  const EventFlowSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: ThemeHelper.darkColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SectionTitle(
              title: 'Etkinlik Programı',
              textColor: ThemeHelper.lightColor,
            ),
            SectionSubtitle(
              title: '6 Mart Cumartesi',
              padding: EdgeInsets.only(bottom: 16),
            ),
            SessionsWidget(),
          ],
        ),
      );
}
