import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'package:festival_flutterturkiye_org/core/model/database_model.dart';

enum SessionStatus { waiting, active, passed }

class Session extends DatabaseModel {
  const Session({
    @required this.title,
    @required this.startingTime,
    @required this.endingTime,
    this.speaker,
  })  : assert(title != null),
        assert(startingTime != null),
        assert(endingTime != null);

  factory Session.fromMap(Map<String, dynamic> map) => Session(
        speaker: map['speaker'],
        title: map['title'],
        startingTime: _timestampToDateTime(map['startingTime']),
        endingTime: _timestampToDateTime(map['endingTime']),
      );

  final String title;
  final DateTime startingTime;
  final DateTime endingTime;
  final DocumentReference speaker;

  SessionStatus get status {
    final currentDate = DateTime(2021, 4, 17, 11);

    final isStarted = currentDate.compareTo(startingTime);

    if (isStarted >= 0) {
      final isEnded = currentDate.compareTo(endingTime);

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
        endingTime,
        speaker,
        status,
      ];

  static DateTime _timestampToDateTime(Timestamp timestamp) =>
      timestamp.toDate();
}
