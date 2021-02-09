import 'package:flutter/material.dart';
import 'package:hackathon_flutterturkiye_org/core/model/session_model.dart';
import 'package:hackathon_flutterturkiye_org/core/model/speaker_model.dart';
import 'package:hackathon_flutterturkiye_org/core/styles/theme_helper.dart';
import 'package:hackathon_flutterturkiye_org/widgets/event_flow_section/session_time_field.dart';
import 'package:hackathon_flutterturkiye_org/widgets/event_flow_section/sessions_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SessionInfoField extends StatelessWidget {
  const SessionInfoField({Key key, @required this.session, this.speaker})
      : assert(session != null),
        super(key: key);

  final SessionModel session;
  final SpeakerModel speaker;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: SessionStatus
        EventFlowSessionText(
          text: session.title,
          sessionStatus: SessionStatus.waiting,
        ),
        const _EventFlowAddToCalendar(),
        EventFlowSpeaker(
          speaker: speaker,
        ),
      ],
    );
  }
}

class _EventFlowAddToCalendar extends StatelessWidget {
  const _EventFlowAddToCalendar();

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: EdgeInsets.zero,
      icon: Icon(MdiIcons.calendarPlus),
      label: Text('Takvime ekle'),
      onPressed: () {
        //TODO: Add to Calendar
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
        // TODO: It will connect to Speaker Detail
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
            style: TextStyle(
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
