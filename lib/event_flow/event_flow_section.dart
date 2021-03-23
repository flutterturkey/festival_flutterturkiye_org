import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/event_flow_session_point.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_info_field.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_time_field.dart';
import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/ui/section_subtitle.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';

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
              title: '17 Nisan Cumartesi',
              padding: EdgeInsets.only(bottom: 16),
            ),
            _SessionsWidget(),
          ],
        ),
      );
}

class _SessionsWidget extends StatelessWidget {
  const _SessionsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _sessions
              .map((session) => _SessionWidget(session: session))
              .toList(),
        ),
      );
}

class _SessionWidget extends StatelessWidget {
  const _SessionWidget({
    @required this.session,
    Key key,
  })  : assert(session != null),
        super(key: key);

  final Session session;

  @override
  Widget build(BuildContext context) {
    final speaker = session.speakerId;
    final startingTime = _getTime(session.startingTime);
    final dueTime = _getTime(session.startingTime.add(session.duration));

    return ResponsiveBuilder(
      smallWidget: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SessionInfoField(
          session: session,
          speaker: speaker,
          isSmallScreen: true,
        ),
      ),
      mediumWidget: _LargeSessionWidget(
        startingTime: startingTime,
        dueTime: dueTime,
        session: session,
        speaker: speaker,
      ),
      largeWidget: _LargeSessionWidget(
        startingTime: startingTime,
        dueTime: dueTime,
        session: session,
        speaker: speaker,
      ),
    );
  }

  String _getTime(DateTime dateTime) =>
      '${_dateFixer(dateTime.hour)}:${_dateFixer(dateTime.minute)}';

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';
}

class _LargeSessionWidget extends StatelessWidget {
  const _LargeSessionWidget({
    @required this.startingTime,
    @required this.dueTime,
    @required this.session,
    this.speaker,
    Key key,
  })  : assert(startingTime != null),
        assert(dueTime != null),
        assert(session != null),
        super(key: key);

  final String startingTime, dueTime;
  final Session session;
  final Speaker speaker;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: EventFlowSessionText(
                text: '$startingTime - $dueTime',
                sessionStatus: session.status,
                textAlign: TextAlign.end,
              ),
            ),
            EventFlowSessionPoint(sessionStatus: session.status),
            Expanded(
              child: SessionInfoField(
                session: session,
                speaker: speaker,
              ),
            ),
          ],
        ),
      );
}

const _speakers = <Speaker>[
  Speaker(
    id: '1',
    image: 'assets/images/speakers/salihgueler.jpg',
    name: 'Salih',
    about: "Superlist'te SSE olarak çalışan Salih, "
        'Flutteri le ilgili bütün etkinliklerde konuşmacı oluyor....',
    title: 'Senior Software Engineer (Flutter) at Superlist',
    twitter: 'salihgueler',
    github: 'salihgueler',
    linkedin: 'msalihguler',
  ),
];

final _sessions = <Session>[
  Session(
    title: 'Açılış Konuşması ve Hackathon Başlangıcı',
    startingTime: DateTime(2021, 4, 17, 9),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 9, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 10),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 10, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 11),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 11, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 12),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 12, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 14),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 4, 17, 14, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    title: 'Festival Sonu',
    startingTime: DateTime(2021, 4, 17, 15),
    duration: const Duration(minutes: 60),
  ),
  Session(
    title: 'Kapanış',
    startingTime: DateTime(2021, 4, 17, 16),
    duration: const Duration(minutes: 30),
  ),
];
