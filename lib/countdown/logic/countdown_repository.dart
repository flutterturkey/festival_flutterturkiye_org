import 'package:festival_flutterturkiye_org/countdown/model/event_status.dart';

final DateTime _eventStartingDate = DateTime(2021, 4, 17, 11);
final DateTime _eventCompletingDate = DateTime(2021, 4, 18, 20);

class CountdownRepository {
  factory CountdownRepository() => _instance;

  CountdownRepository._();

  static final CountdownRepository _instance = CountdownRepository._();

  Duration get countdownInitialData {
    if (!isEventStarted) {
      return eventStartingRemainingTime;
    } else if (!isEventCompleted) {
      return eventCompletingRemainingTime;
    }
    return const Duration();
  }

  Duration get eventStartingRemainingTime =>
      _remainingTimeCalculator(_eventStartingDate);

  Duration get eventCompletingRemainingTime =>
      _remainingTimeCalculator(_eventCompletingDate);

  Duration _remainingTimeCalculator(DateTime dateTime) =>
      dateTime.difference(DateTime.now());

  bool get isEventStarted => eventStartingRemainingTime.isNegative;
  bool get isEventCompleted => eventCompletingRemainingTime.isNegative;

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
      return getStartingCountdown();
    } else if (!isEventCompleted) {
      return getCompletingCountdown();
    }
    return const Stream.empty();
  }

  Stream<Duration> getStartingCountdown() =>
      _countdownDurationCalculator(_eventStartingDate);

  Stream<Duration> getCompletingCountdown() =>
      _countdownDurationCalculator(_eventCompletingDate);

  Stream<Duration> _countdownDurationCalculator(DateTime dateTime) =>
      Stream.periodic(
        const Duration(seconds: 1),
        (_) => _remainingTimeCalculator(dateTime),
      );
}
