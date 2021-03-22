import 'package:equatable/equatable.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';
import 'package:meta/meta.dart';

enum SessionStatus { waiting, active, passed }

class Session extends Equatable {
  const Session({
    @required this.title,
    @required this.startingTime,
    @required this.duration,
    this.speakerId,
  })  : assert(title != null),
        assert(startingTime != null),
        assert(duration != null);

  final Speaker speakerId;
  final String title;
  final DateTime startingTime;
  final Duration duration;

  SessionStatus get status {
    final currentDate = DateTime(2021, 4, 17, 11);

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

  @override
  List<Object> get props => [
        title,
        startingTime,
        speakerId,
        duration,
        status,
      ];
}
