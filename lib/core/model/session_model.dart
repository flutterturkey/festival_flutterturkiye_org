import 'package:festival_flutterturkiye_org/core/model/speaker_model.dart';
import 'package:meta/meta.dart';

enum SessionStatus { waiting, active, passed }

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

  SessionStatus get status {
    final currentDate = DateTime(2021, 3, 6, 11, 45);

    final isStarted = currentDate.compareTo(startingTime);

    if (isStarted >= 0) {
      final dueTime = startingTime.add(duration);
      final isEnded = currentDate.compareTo(dueTime);

      if (isEnded < 0) {
        return SessionStatus.active;
      }
      return SessionStatus.passed;
    } else {
      return SessionStatus.waiting;
    }
  }
}
