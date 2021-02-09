import 'package:hackathon_flutterturkiye_org/core/model/speaker_model.dart';
import 'package:meta/meta.dart';

class SessionModel {
  final SpeakerModel speakerId;
  final String title;
  final DateTime startingTime;
  final Duration duration;

  const SessionModel({
    this.speakerId,
    @required this.title,
    @required this.startingTime,
    @required this.duration,
  })  : assert(title != null),
        assert(startingTime != null),
        assert(duration != null);
}
