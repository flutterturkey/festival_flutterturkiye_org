import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/event_flow_session_point.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_info_field.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_time_field.dart';
import 'package:festival_flutterturkiye_org/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

const _speakers = <Speaker>[
  Speaker(
    id: '1',
    image: 'assets/images/speakers/salihgueler.jpg',
    name: 'Salih',
    surname: 'Güler',
    about: "Superlist'te SSE olarak çalışan Salih, "
        'Flutteri le ilgili bütün etkinliklerde konuşmacı oluyor....',
    company: 'Senior Software Engineer (Flutter) at Superlist',
    twitter: 'salihgueler',
    github: 'salihgueler',
    linkedin: 'msalihguler',
  ),
];

final _sessions = <Session>[
  Session(
    title: 'Açılış Konuşması ve Hackathon Başlangıcı',
    startingTime: DateTime(2021, 3, 6, 9),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 9, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 10),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 10, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 11),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 11, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 12),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 12, 30),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 14),
    duration: const Duration(minutes: 30),
  ),
  Session(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 14, 30),
    duration: const Duration(minutes: 30),
  ),
];

class SessionsWidget extends StatelessWidget {
  const SessionsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SessionWidget(session: _sessions[0]),
            _SessionWidget(session: _sessions[1]),
            _SessionWidget(session: _sessions[2]),
            _SessionWidget(session: _sessions[3]),
            _SessionWidget(session: _sessions[4]),
            _SessionWidget(session: _sessions[5]),
            _SessionWidget(session: _sessions[6]),
            _SessionWidget(session: _sessions[7]),
            _SessionWidget(session: _sessions[8]),
            _SessionWidget(session: _sessions[9]),
          ],
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
      mediumWidget: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: EventFlowSessionText(
                text: '$startingTime - $dueTime',
                sessionStatus: session.status,
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
      ),
      largeWidget: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: EventFlowSessionText(
                text: '$startingTime - $dueTime',
                sessionStatus: session.status,
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
      ),
    );
  }

  Widget widget({@required Widget child}) {
    assert(child != null);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: child,
    );
  }

  String _getTime(DateTime dateTime) =>
      '${_dateFixer(dateTime.hour)}:${_dateFixer(dateTime.minute)}';

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';
}
