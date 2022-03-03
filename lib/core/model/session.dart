import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/model/database_model.dart';

enum SessionStatus { waiting, active, passed }

class Session extends DatabaseModel {
  const Session({
    this.title,
    this.startingTime,
    this.endingTime,
    this.presentation,
    this.reference,
    this.speakers,
  });

  factory Session.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Session(
      reference: snapshot.reference,
      speakers: data['speakers'] != null
          ? List<DocumentReference>.from(
              data['speakers'].map((speaker) => speaker),
            )
          : [],
      title: data['title'],
      presentation: data['presentation'],
      startingTime: _timestampToDateTime(data['startingTime']),
      endingTime: _timestampToDateTime(data['endingTime']),
    );
  }

  final String? title;
  final DateTime? startingTime;
  final DateTime? endingTime;
  final List<DocumentReference>? speakers;
  final String? presentation;
  final DocumentReference? reference;

  SessionStatus get status {
    final currentDate = DateTime.now();
    final isStarted = currentDate.compareTo(startingTime!);

    if (isStarted >= 0) {
      final isEnded = currentDate.compareTo(endingTime!);

      if (isEnded < 0) {
        return SessionStatus.active;
      }
      return SessionStatus.passed;
    } else {
      return SessionStatus.waiting;
    }
  }

  @override
  List<Object?> get props => [
        title,
        startingTime,
        endingTime,
        speakers,
        presentation,
        reference,
        status,
      ];

  static DateTime _timestampToDateTime(Timestamp timestamp) =>
      timestamp.toDate();
}
