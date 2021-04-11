import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import 'package:festival_flutterturkiye_org/core/model/database_model.dart';

enum SessionStatus { waiting, active, passed }

class Session extends DatabaseModel {
  const Session({
    @required this.title,
    @required this.startingTime,
    @required this.endingTime,
    @required this.reference,
    this.speaker,
  })  : assert(title != null),
        assert(startingTime != null),
        assert(endingTime != null),
        assert(reference != null);

  factory Session.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Session(
      reference: snapshot.reference,
      speaker: data['speaker'],
      title: data['title'],
      startingTime: _timestampToDateTime(data['startingTime']),
      endingTime: _timestampToDateTime(data['endingTime']),
    );
  }

  final String title;
  final DateTime startingTime;
  final DateTime endingTime;
  final DocumentReference speaker;
  final DocumentReference reference;

  SessionStatus get status {
    final currentDate = DateTime.now();

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
        reference,
        status,
      ];

  static DateTime _timestampToDateTime(Timestamp timestamp) =>
      timestamp.toDate();
}
