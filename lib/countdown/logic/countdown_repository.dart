import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';

final DateTime _eventStartingDate = DateTime(2022, 3, 26, 11, 30);
final DateTime _eventCompletingDate = DateTime(2022, 3, 27, 20, 45);

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
      return _countdownDurationCalculator(_eventStartingDate);
    } else if (!isEventCompleted) {
      return _countdownDurationCalculator(_eventCompletingDate);
    }
    return const Stream.empty();
  }

  Duration get _eventStartingRemainingTime =>
      _remainingTimeCalculator(_eventStartingDate);

  Duration get _eventCompletingRemainingTime =>
      _remainingTimeCalculator(_eventCompletingDate);

  Stream<Duration> _countdownDurationCalculator(DateTime dateTime) =>
      Stream.periodic(
        const Duration(seconds: 1),
        (_) => _remainingTimeCalculator(dateTime),
      );

  Duration _remainingTimeCalculator(DateTime dateTime) =>
      dateTime.difference(DateTime.now());
}
