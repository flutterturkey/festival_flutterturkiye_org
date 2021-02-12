import 'package:festival_flutterturkiye_org/core/services/calendar_client.dart';
import 'package:flutter/material.dart';
import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SessionAbout extends StatelessWidget {
  const SessionAbout({
    Key key,
    @required this.name,
    @required this.startingDate,
    @required this.dueDate,
  })  : assert(name != null),
        assert(startingDate != null),
        assert(dueDate != null),
        super(key: key);

  final String name;
  final DateTime startingDate;
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SpeakerDetailSubTitle(title: 'Konuşma'),
        SpeakerDetailSubText(text: name),
        const SizedBox(height: 8.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SpeakerDetailSessionDate(
              startingDate: startingDate,
              dueDate: dueDate,
            ),
            _SpeakerDetailAddToCalendar()
          ],
        ),
      ],
    );
  }
}

class _SpeakerDetailAddToCalendar extends StatelessWidget {
  const _SpeakerDetailAddToCalendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      icon: const Icon(MdiIcons.calendarPlus),
      label: const Text(
        'Takvime Ekle',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      color: ThemeHelper.blueColor,
      onPressed: () {
        /* 
          * TODO: Add to Calendar will be added. Issue: #43
          * https://github.com/flutterturkey/festival_flutterturkiye_org/issues/43
         */
        final startDate = DateTime.now();
        final endDate = startDate.add(Duration(minutes: 30));
        CalendarClient.instance.insertEvent('Deneme', startDate, endDate);
      },
    );
  }
}

class _SpeakerDetailSessionDate extends StatelessWidget {
  const _SpeakerDetailSessionDate({
    Key key,
    @required this.startingDate,
    @required this.dueDate,
  })  : assert(startingDate != null),
        assert(dueDate != null),
        super(key: key);

  final DateTime startingDate;
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) {
    final sessionDateText =
        '${_dateCorrector(startingDate.day)} Mart ${_dateCorrector(startingDate.year)} ';

    final sessionTimeText =
        '${_dateCorrector(startingDate.hour)}:${_dateCorrector(startingDate.minute)} - '
        '${_dateCorrector(dueDate.hour)}:${_dateCorrector(dueDate.minute)}';
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SpeakerDetailSubText(
          text: sessionDateText,
          fontWeight: FontWeight.w500,
          textColor: ThemeHelper.eventPointColor,
        ),
        SpeakerDetailSubText(
          text: sessionTimeText,
          fontWeight: FontWeight.w600,
          textColor: ThemeHelper.eventPointColor,
        ),
      ],
    );
  }

  String _dateCorrector(int datePart) {
    return datePart < 10 ? '0$datePart' : '$datePart';
  }
}
