import 'package:festival_flutterturkiye_org/core/model/session_model.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker_model.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/event_flow_session_point.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_info_field.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_time_field.dart';
import 'package:flutter/material.dart';

final _speakers = <SpeakerModel>[
  SpeakerModel(
    id: '1',
    image: 'assets/images/speakers/salihgueler.jpg',
    name: 'Salih',
    surname: 'Güler',
    about:
        "Superlist'te SSE olarak çalışan Salih, Flutteri le ilgili bütün etkinliklerde konuşmacı oluyor....",
    company: 'Senior Software Engineer (Flutter) at Superlist',
    twitter: 'salihgueler',
    github: 'salihgueler',
    linkedin: 'msalihguler',
  ),
];
final _sessions = <SessionModel>[
  SessionModel(
    title: 'Açılış Konuşması ve Hackathon Başlangıcı',
    startingTime: DateTime(2021, 3, 6, 9, 0),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 9, 30),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 10, 00),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 10, 30),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 11, 00),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 11, 30),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 12, 00),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 12, 30),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 14, 00),
    duration: Duration(minutes: 30),
  ),
  SessionModel(
    speakerId: _speakers[0],
    title: "Superlist'te nasıl uygulama geliştiriyoruz?",
    startingTime: DateTime(2021, 3, 6, 14, 30),
    duration: Duration(minutes: 30),
  ),
];

class SessionsWidget extends StatelessWidget {
  const SessionsWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
}

class _SessionWidget extends StatelessWidget {
  const _SessionWidget({
    Key key,
    @required this.session,
  })  : assert(session != null),
        super(key: key);

  final SessionModel session;
  @override
  Widget build(BuildContext context) {
    // TODO: Refactor speaker
    final speaker = session.speakerId;
    final startingTime = _getTime(session.startingTime);
    final dueTime = _getTime(session.startingTime.add(session.duration));
    final sessionStatus = session.status;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: EventFlowSessionText(
              text: '$startingTime - $dueTime',
              sessionStatus: sessionStatus,
            ),
          ),
          EventFlowSessionPoint(sessionStatus: sessionStatus),
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

  String _getTime(DateTime dateTime) =>
      '${_dateFixer(dateTime.hour)}:${_dateFixer(dateTime.minute)}';

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';
}
