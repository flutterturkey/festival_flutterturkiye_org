import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/speaker_detail/speaker_detail.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SessionAbout extends StatelessWidget {
  const SessionAbout({
    @required this.name,
    @required this.startingDate,
    @required this.dueDate,
    Key key,
  })  : assert(name != null),
        assert(startingDate != null),
        assert(dueDate != null),
        super(key: key);

  final String name;
  final DateTime startingDate;
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpeakerDetailSubTitle(title: 'Konuşma'),
          SpeakerDetailSubText(text: name),
          const SizedBox(height: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SpeakerDetailSessionDate(
                startingDate: startingDate,
                dueDate: dueDate,
              ),
              const _SpeakerDetailAddToCalendar()
            ],
          ),
        ],
      );
}

class _SpeakerDetailAddToCalendar extends StatelessWidget {
  const _SpeakerDetailAddToCalendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        icon: const Icon(MdiIcons.calendarPlus),
        label: const Text(
          'Takvime Ekle',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          /*
          * TODO: Add to Calendar will be added. Issue: #43
          * https://github.com/flutterturkey/festival_flutterturkiye_org/issues/43
         */
        },
      );
}

class _SpeakerDetailSessionDate extends StatelessWidget {
  const _SpeakerDetailSessionDate({
    @required this.startingDate,
    @required this.dueDate,
    Key key,
  })  : assert(startingDate != null),
        assert(dueDate != null),
        super(key: key);

  final DateTime startingDate;
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) {
    final sessionDateText = '${_dateCorrector(startingDate.day)} '
        'Mart ${_dateCorrector(startingDate.year)} ';

    final sessionTimeText = '${_dateCorrector(startingDate.hour)}:'
        '${_dateCorrector(startingDate.minute)} - '
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

  String _dateCorrector(int datePart) =>
      datePart < 10 ? '0$datePart' : '$datePart';
}
