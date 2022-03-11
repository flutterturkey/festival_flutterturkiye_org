import 'package:festival_flutterturkiye_org/core/model/calendar.dart';
import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/ui/speaker_image.dart';
import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/core/utils/dialog_helper.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/event_flow/ui/session_time_field.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionInfoField extends StatelessWidget {
  const SessionInfoField({
    required this.speakers,
    required this.session,
    this.horizontalAxisAlignment = CrossAxisAlignment.start,
    this.isSmallScreen = false,
    Key? key,
  }) : super(key: key);

  final Session session;
  final List<Speaker> speakers;
  final CrossAxisAlignment horizontalAxisAlignment;
  final bool isSmallScreen;

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
        _EventFlowAddToCalendar(session: session),
        _EventFlowDownloadSlides(session: session),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: speakers
              .map((speaker) => _EventFlowSpeaker(speaker: speaker))
              .toList(),
        ),
      ],
    );
  }

  String _getTime(DateTime dateTime) =>
      '${_dateFixer(dateTime.hour)}:${_dateFixer(dateTime.minute)}';

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';
}

class _EventFlowAddToCalendar extends StatelessWidget {
  const _EventFlowAddToCalendar({required this.session});

  final Session session;

  @override
  Widget build(BuildContext context) {
    if (session.status == SessionStatus.waiting) {
      return TextButton.icon(
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

    return const SizedBox.shrink();
  }
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
  const _EventFlowSpeaker({required this.speaker, Key? key}) : super(key: key);

  final Speaker speaker;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => DialogHelper.showSpeaker(context, speaker: speaker),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpeakerImage(
                  speakerImage: speaker.image,
                  imageSize: 64,
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
