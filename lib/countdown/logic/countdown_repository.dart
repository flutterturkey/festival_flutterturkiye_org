import 'package:festival_flutterturkiye_org/core/utils/config.dart';
import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';

class CountdownRepository {
  Duration get countdownInitialData {
    if (!isEventStarted) {
      return _eventStartingRemainingTime;
    } else if (!isEventCompleted) {
      return _eventCompletingRemainingTime;
    }
    return const Duration();
  }

  bool get isEventStarted => _eventStartingRemainingTime.isNegative;
  bool get isEventCompleted => _eventCompletingRemainingTime.isNegative;

  EventStatus get eventStatus {
    if (isEventCompleted) {
      return EventStatus.completed;
    } else if (isEventStarted) {
      return EventStatus.started;
    } else {
      return EventStatus.waiting;
    }
  }

  Stream<Duration> getCountdown() {
    if (!isEventStarted) {
      return _countdownDurationCalculator(Config.eventConfig.startingDate);
    } else if (!isEventCompleted) {
      return _countdownDurationCalculator(Config.eventConfig.endingDate);
    }
    return const Stream.empty();
  }

  Duration get _eventStartingRemainingTime =>
      _remainingTimeCalculator(Config.eventConfig.startingDate);

  Duration get _eventCompletingRemainingTime =>
      _remainingTimeCalculator(Config.eventConfig.endingDate);

  Stream<Duration> _countdownDurationCalculator(DateTime dateTime) =>
      Stream.periodic(
        const Duration(seconds: 1),
        (_) => _remainingTimeCalculator(dateTime),
      );

  Duration _remainingTimeCalculator(DateTime dateTime) =>
      dateTime.difference(DateTime.now());
}
