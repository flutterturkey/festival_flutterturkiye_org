import 'package:flutter/material.dart';
import 'package:festival_flutterturkiye_org/core/model/session_model.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker_model.dart';
import 'package:festival_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:festival_flutterturkiye_org/widgets/event_flow_section/session_time_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SessionInfoField extends StatelessWidget {
  const SessionInfoField({
    Key key,
    @required this.session,
    this.speaker,
    this.horizontalAxisAlignment = CrossAxisAlignment.start,
    this.isSmallScreen = false,
  })  : assert(session != null),
        assert(horizontalAxisAlignment != null),
        assert(isSmallScreen != null),
        super(key: key);

  final SessionModel session;
  final SpeakerModel speaker;
  final CrossAxisAlignment horizontalAxisAlignment;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    final startingTime = _getTime(session.startingTime);
    final dueTime = _getTime(session.startingTime.add(session.duration));

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: horizontalAxisAlignment,
      children: [
        EventFlowSessionText(
          text: session.title,
          sessionStatus: session.status,
        ),
        if (isSmallScreen) ...[
          const SizedBox(height: 8.0),
          EventFlowSessionText(
            text: '$startingTime - $dueTime',
            sessionStatus: session.status,
          ),
        ],
        const _EventFlowAddToCalendar(),
        const SizedBox(height: 8.0),
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
  const _EventFlowAddToCalendar();

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: EdgeInsets.zero,
      icon: const Icon(MdiIcons.calendarPlus),
      label: const Text('Takvime ekle'),
      onPressed: () {
        //TODO: Add to Calendar Issue: #43
      },
    );
  }
}

class EventFlowSpeaker extends StatelessWidget {
  const EventFlowSpeaker({Key key, this.speaker}) : super(key: key);

  final SpeakerModel speaker;

  @override
  Widget build(BuildContext context) {
    if (speaker == null) {
      return SizedBox.shrink();
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
            imageSize: 64.0,
          ),
          const SizedBox(width: 8.0),
          Text(
            '${speaker.name} ${speaker.surname}',
            style: const TextStyle(
              color: ThemeHelper.blueColor,
              fontSize: 16.0,
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
    Key key,
    @required this.speakerImage,
    @required this.imageSize,
  })  : assert(speakerImage != null),
        assert(imageSize != null),
        super(key: key);

  final String speakerImage;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
