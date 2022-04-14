import 'package:festival_flutterturkiye_org/core/model/calendar.dart';
import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/speaker_image.dart';
import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_time_field.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionInfoField extends StatelessWidget {
  const SessionInfoField({
    required this.speakers,
    required this.session,
    required this.speakerNotifier,
    this.horizontalAxisAlignment = CrossAxisAlignment.start,
    this.isSmallScreen = false,
    Key? key,
  }) : super(key: key);

  final Session session;
  final List<Speaker> speakers;
  final CrossAxisAlignment horizontalAxisAlignment;
  final bool isSmallScreen;
  final ValueNotifier<Speaker?> speakerNotifier;

  @override
  Widget build(BuildContext context) {
    final startingTime = _getTime(session.startingTime);
    final endingTime = _getTime(session.endingTime);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: horizontalAxisAlignment,
      children: [
        EventFlowSessionText(
          text: session.title,
          sessionStatus: session.status,
        ),

        // This part used in `SessionWidget`for
        // Medium Screen and Large Screen
        if (isSmallScreen) ...[
          const SizedBox(height: 8),
          EventFlowSessionText(
            text: '$startingTime - $endingTime',
            sessionStatus: session.status,
          ),
        ],
        const SizedBox(height: 8),
        _EventFlowActionButton(session: session),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: speakers
              .map((speaker) => _EventFlowSpeaker(
                    speaker: speaker,
                    speakerNotifier: speakerNotifier,
                  ))
              .toList(),
        ),
      ],
    );
  }

  String _getTime(DateTime dateTime) =>
      '${_dateFixer(dateTime.hour)}:${_dateFixer(dateTime.minute)}';

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';
}

class _EventFlowActionButton extends StatelessWidget {
  const _EventFlowActionButton({required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    final status = session.status;
    if (status == SessionStatus.waiting) {
      return _EventFlowAddToCalendar(session: session);
    } else if (status == SessionStatus.passed) {
      return _EventFlowDownloadSlides(session: session);
    } else {
      return _EventFlowWatch(session: session);
    }
  }
}

class _EventFlowAddToCalendar extends StatelessWidget {
  const _EventFlowAddToCalendar({required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) => TextButton.icon(
        icon: const Icon(MdiIcons.calendarPlus),
        label: const Text('Takvime ekle'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(ThemeHelper.blueColor),
        ),
        onPressed: () async {
          final calendar = Calendar(
            title: session.title,
            description: Config.eventConfig.name,
            startingTime: session.startingTime,
            endingTime: session.endingTime,
          );
          final link = calendar.toLink();

          if (await canLaunch(link)) {
            await launch(link);
          }
        },
      );
}

class _EventFlowWatch extends StatelessWidget {
  const _EventFlowWatch({required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) => TextButton.icon(
        onPressed: () async {
          late final String streamUrl;
          if (session.startingTime
                  .compareTo(Config.eventConfig.firstDayEndingDate) >
              0) {
            streamUrl = Config.secondDayStreamUrl;
          } else {
            streamUrl = Config.firstDayStreamUrl;
          }

          if (await canLaunch(streamUrl)) {
            await launch(streamUrl);
          }
        },
        icon: const Icon(MdiIcons.video),
        label: const Text('İzle'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(ThemeHelper.blueColor),
        ),
      );
}

class _EventFlowDownloadSlides extends StatelessWidget {
  const _EventFlowDownloadSlides({required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    if (session.presentation?.isNotEmpty == true) {
      return TextButton.icon(
        icon: const Icon(MdiIcons.download),
        label: const Text('Sunumu indir'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(ThemeHelper.blueColor),
        ),
        onPressed: () async {
          final presentation = session.presentation;

          if (presentation != null) {
            if (await canLaunch(presentation)) {
              await launch(presentation);
            }
          }
        },
      );
    }

    return const SizedBox.shrink();
  }
}

class _EventFlowSpeaker extends StatelessWidget {
  const _EventFlowSpeaker({
    required this.speakerNotifier,
    required this.speaker,
    Key? key,
  }) : super(key: key);

  final Speaker speaker;
  final ValueNotifier<Speaker?> speakerNotifier;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => speakerNotifier.value = speaker,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpeakerImage(
                  speakerImage: speaker.image,
                  imageSize: 32,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    speaker.name ?? '',
                    softWrap: true,
                    style: const TextStyle(
                      color: ThemeHelper.speakerDetailImageBorder,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
