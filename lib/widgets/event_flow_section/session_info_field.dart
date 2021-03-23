import 'package:festival_flutterturkiye_org/core/model/session.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:festival_flutterturkiye_org/core/utils/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_time_field.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SessionInfoField extends StatelessWidget {
  const SessionInfoField({
    @required this.session,
    this.horizontalAxisAlignment = CrossAxisAlignment.start,
    this.isSmallScreen = false,
    this.speaker,
    Key key,
  })  : assert(session != null),
        assert(horizontalAxisAlignment != null),
        assert(isSmallScreen != null),
        super(key: key);

  final Session session;
  final Speaker speaker;
  final CrossAxisAlignment horizontalAxisAlignment;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    final startingTime = _getTime(session.startingTime);
    final dueTime = _getTime(session.startingTime.add(session.duration));

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
            text: '$startingTime - $dueTime',
            sessionStatus: session.status,
          ),
        ],
        const SizedBox(height: 8),
        _EventFlowAddToCalendar(session: session),
        const SizedBox(height: 8),
        EventFlowSpeaker(
          speaker: speaker,
        ),
      ],
    );
  }

  String _getTime(DateTime dateTime) =>
      '${_dateFixer(dateTime.hour)}:${_dateFixer(dateTime.minute)}';

  String _dateFixer(int date) => '${date < 10 ? '0' : ''}$date';
}

class _EventFlowAddToCalendar extends StatelessWidget {
  const _EventFlowAddToCalendar({@required this.session});

  final Session session;
  @override
  Widget build(BuildContext context) {
    if (session.status == SessionStatus.waiting) {
      return TextButton.icon(
        icon: const Icon(MdiIcons.calendarPlus),
        label: const Text('Takvime ekle'),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(ThemeHelper.lightColor),
        ),
        onPressed: () {
          //TODO: Add to Calendar Issue: #43
        },
      );
    }

    return const SizedBox.shrink();
  }
}

class EventFlowSpeaker extends StatelessWidget {
  const EventFlowSpeaker({Key key, this.speaker}) : super(key: key);

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    if (speaker == null) {
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        // TODO: It will connect to Speaker Detail Issue: #57
        debugPrint('Go To Speaker Detail');
      },
      child: Row(
        children: [
          _SpeakerImage(
            speakerImage: speaker.image,
            imageSize: 64,
          ),
          const SizedBox(width: 8),
          Text(
            speaker.name,
            style: const TextStyle(
              color: ThemeHelper.blueColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

// TODO: It will be merged with SpeakerImage after PR #38
class _SpeakerImage extends StatelessWidget {
  const _SpeakerImage({
    @required this.speakerImage,
    @required this.imageSize,
    Key key,
  })  : assert(speakerImage != null),
        assert(imageSize != null),
        super(key: key);

  final String speakerImage;
  final double imageSize;

  @override
  Widget build(BuildContext context) => Container(
        height: imageSize,
        width: imageSize,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(speakerImage),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.circle,
          border: Border.all(
            color: ThemeHelper.blueColor,
            width: 2,
          ),
        ),
      );
}
