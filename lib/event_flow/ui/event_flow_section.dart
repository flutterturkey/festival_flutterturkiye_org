import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_subtitle.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_info_field.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_time_field.dart';

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

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ResponsiveBuilder(
        smallWidget: _SmallSessionWidget(
          session: session,
          speaker: speaker,
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
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: EventFlowSessionText(
              text: '$startingTime - $dueTime',
              sessionStatus: session.status,
              textAlign: TextAlign.end,
            ),
          ),
          _EventFlowSessionPoint(sessionStatus: session.status),
          Expanded(
            child: SessionInfoField(
              session: session,
              speaker: speaker,
            ),
          ),
        ],
      );
}

class _SmallSessionWidget extends StatelessWidget {
  const _SmallSessionWidget({
    @required this.session,
    this.speaker,
    Key key,
  })  : assert(session != null),
        super(key: key);

  final Session session;
  final Speaker speaker;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EventFlowSessionPoint(sessionStatus: session.status),
          Expanded(
            child: SessionInfoField(
              session: session,
              speaker: speaker,
              isSmallScreen: true,
            ),
          ),
        ],
      );
}

class _EventFlowSessionPoint extends StatelessWidget {
  const _EventFlowSessionPoint({
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
