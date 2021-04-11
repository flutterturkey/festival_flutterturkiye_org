import 'package:festival_flutterturkiye_org/core/logic/speaker_repository.dart';
import 'package:flutter/material.dart';

import 'package:festival_flutterturkiye_org/core/logic/session_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_subtitle.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_info_field.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_time_field.dart';

class EventFlowSection extends StatelessWidget {
  EventFlowSection({
    @required this.focusNode,
    Key key,
  })  : assert(focusNode != null),
        super(key: key);

  final FocusNode focusNode;
  final sessionRepository = getIt.get<SessionRepository>();

  @override
  Widget build(BuildContext context) {
    final sessionDays = <Widget>[
      _SessionsWidget(
        title: '17 Nisan Cumartesi',
        sessions: sessionRepository.sessions
            .where((session) =>
                session.startingTime.compareTo(DateTime(2021, 04, 18)) < 0)
            .toList(),
      ),
      _SessionsWidget(
        title: '18 Nisan Pazar',
        sessions: sessionRepository.sessions
            .where((session) =>
                session.startingTime.compareTo(DateTime(2021, 04, 18)) > 0)
            .toList(),
      ),
    ];

    return Focus(
      focusNode: focusNode,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: ThemeHelper.darkColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SectionTitle(
              title: 'Etkinlik Programı',
              textColor: ThemeHelper.lightColor,
            ),
            // TODO: It is faster solution. It will be fixed later.
            ResponsiveBuilder(
              smallWidget: Column(children: sessionDays),
              mediumWidget: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sessionDays
                      .map(
                        (day) => Expanded(child: day),
                      )
                      .toList()),
              largeWidget: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: sessionDays
                      .map(
                        (day) => Expanded(child: day),
                      )
                      .toList()),
            )
          ],
        ),
      ),
    );
  }
}

class _SessionsWidget extends StatelessWidget {
  const _SessionsWidget(
      {@required this.title, @required this.sessions, Key key})
      : super(key: key);

  final String title;
  final List<Session> sessions;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          SectionSubtitle(
            title: title,
            padding: const EdgeInsets.only(bottom: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: sessions
                  .map((session) => _SessionWidget(session: session))
                  .toList(growable: false),
            ),
          ),
        ],
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
    final startingTime = _getTime(session.startingTime);
    final endingTime = _getTime(session.endingTime);
    final speakerRepository = getIt.get<SpeakerRepository>();

    final speaker = speakerRepository.speakers.firstWhere(
      (speaker) => speaker.reference == session.speaker,
      orElse: () => null,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ResponsiveBuilder(
        smallWidget: _SmallSessionWidget(
          session: session,
          speaker: speaker,
        ),
        mediumWidget: _LargeSessionWidget(
          startingTime: startingTime,
          dueTime: endingTime,
          session: session,
          speaker: speaker,
        ),
        largeWidget: _LargeSessionWidget(
          startingTime: startingTime,
          dueTime: endingTime,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: radius,
        width: radius,
        child: DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: pointColor),
        ),
      ),
    );
  }
}
