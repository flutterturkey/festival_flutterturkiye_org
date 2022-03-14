import 'package:festival_flutterturkiye_org/core/logic/session_repository.dart';
import 'package:festival_flutterturkiye_org/core/logic/speaker_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/circle_image_with_border.dart';
import 'package:festival_flutterturkiye_org/core/ui/responsive_builder.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_subtitle.dart';
import 'package:festival_flutterturkiye_org/core/ui/section_title.dart';
import 'package:festival_flutterturkiye_org/core/utils/assets.dart';
import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/core/utils/date_helper.dart';
import 'package:festival_flutterturkiye_org/core/utils/get_it_initializer.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_info_field.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_time_field.dart';
import 'package:flutter/material.dart';

class EventFlowSection extends StatelessWidget {
  EventFlowSection({
    required this.focusNode,
    required this.speakerNotifier,
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode;
  final sessionRepository = getIt.get<SessionRepository>();
  final ValueNotifier<Speaker?> speakerNotifier;

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: It is faster solution. It will be fixed later.
    final sessionDays = <Widget>[
      _SessionsWidget(
        speakerNotifier: speakerNotifier,
        title: Config.eventConfig.startingDateName,
        sessions: sessionRepository.sessions
            .where((session) => _isVisible(
                  session: session,
                  eventDate: Config.eventConfig.startingDate,
                ))
            .toList(),
      ),
      _SessionsWidget(
        speakerNotifier: speakerNotifier,
        title: Config.eventConfig.endingDateName,
        sessions: sessionRepository.sessions
            .where((session) => _isVisible(
                  session: session,
                  eventDate: Config.eventConfig.endingDate,
                ))
            .toList(),
      ),
    ];

    return Focus(
      focusNode: focusNode,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: ThemeHelper.primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(64),
          ),
        ),
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
                children:
                    sessionDays.map((day) => Expanded(child: day)).toList(),
              ),
              largeWidget: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    sessionDays.map((day) => Expanded(child: day)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isVisible({
    required Session session,
    required DateTime eventDate,
  }) {
    final starting = session.startingTime.compareDateTo(eventDate);
    final ending = session.endingTime.compareDateTo(eventDate);

    return starting || ending;
  }
}

class _SessionsWidget extends StatelessWidget {
  const _SessionsWidget(
      {required this.title,
      required this.sessions,
      required this.speakerNotifier,
      Key? key})
      : super(key: key);

  final String title;
  final List<Session> sessions;
  final ValueNotifier<Speaker?> speakerNotifier;

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
                  .map((session) => _SessionWidget(
                        session: session,
                        speakerNotifier: speakerNotifier,
                      ))
                  .toList(growable: false),
            ),
          ),
        ],
      );
}

class _SessionWidget extends StatelessWidget {
  const _SessionWidget({
    required this.session,
    required this.speakerNotifier,
    Key? key,
  }) : super(key: key);

  final Session session;
  final ValueNotifier<Speaker?> speakerNotifier;

  @override
  Widget build(BuildContext context) {
    final startingTime = _getTime(session.startingTime);
    final endingTime = _getTime(session.endingTime);
    final speakerRepository = getIt.get<SpeakerRepository>();

    final speaker = speakerRepository.speakers
        .where(
          (speaker) => session.speakers?.contains(speaker.reference) ?? false,
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ResponsiveBuilder(
        smallWidget: _SmallSessionWidget(
          session: session,
          speakers: speaker,
          speakerNotifier: speakerNotifier,
        ),
        mediumWidget: _LargeSessionWidget(
          startingTime: startingTime,
          dueTime: endingTime,
          session: session,
          speakers: speaker,
          speakerNotifier: speakerNotifier,
        ),
        largeWidget: _LargeSessionWidget(
          startingTime: startingTime,
          dueTime: endingTime,
          session: session,
          speakers: speaker,
          speakerNotifier: speakerNotifier,
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
    required this.startingTime,
    required this.dueTime,
    required this.session,
    required this.speakers,
    required this.speakerNotifier,
    Key? key,
  }) : super(key: key);

  final String startingTime, dueTime;
  final Session session;
  final List<Speaker> speakers;
  final ValueNotifier<Speaker?> speakerNotifier;

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
          _EventFlowSessionPoint(
            sessionStatus: session.status,
            sessionLanguage: session.sessionLanguage,
          ),
          Expanded(
            child: SessionInfoField(
              session: session,
              speakers: speakers,
              speakerNotifier: speakerNotifier,
            ),
          ),
        ],
      );
}

class _SmallSessionWidget extends StatelessWidget {
  const _SmallSessionWidget({
    required this.session,
    required this.speakers,
    required this.speakerNotifier,
    Key? key,
  }) : super(key: key);

  final Session session;
  final List<Speaker> speakers;
  final ValueNotifier<Speaker?> speakerNotifier;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EventFlowSessionPoint(
            sessionStatus: session.status,
            sessionLanguage: session.sessionLanguage,
          ),
          Expanded(
            child: SessionInfoField(
              session: session,
              speakers: speakers,
              isSmallScreen: true,
              speakerNotifier: speakerNotifier,
            ),
          ),
        ],
      );
}

class _EventFlowSessionPoint extends StatelessWidget {
  const _EventFlowSessionPoint({
    required this.sessionStatus,
    required this.sessionLanguage,
    Key? key,
  }) : super(key: key);
  final SessionStatus sessionStatus;
  final SessionLanguage sessionLanguage;

  @override
  Widget build(BuildContext context) {
    Color pointColor;
    double radius;

    switch (sessionStatus) {
      case SessionStatus.active:
        pointColor = ThemeHelper.eventPointColor;
        radius = 16.0;
        break;
      case SessionStatus.passed:
        pointColor = ThemeHelper.appBarActionColor;
        radius = 12.0;
        break;
      case SessionStatus.waiting:
      default:
        pointColor = ThemeHelper.blueColor;
        radius = 12.0;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CircleImageWithBorder(
        image: image,
        imageSize: radius,
        borderSize: 2,
        borderColor: pointColor,
      ),
    );
  }

  String get image =>
      ImageAsset('${sessionLanguage.name}.png', subfolder: 'flags').toString();
}
