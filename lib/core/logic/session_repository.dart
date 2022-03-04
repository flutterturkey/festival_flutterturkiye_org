import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/logic/database_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/session.dart';

class SessionRepository extends DatabaseRepository<Session> {
  SessionRepository() : super('sessions');

  List<Session> _sessions = [];

  List<Session> get sessions => _sessions;

  @override
  Future<QuerySnapshot> getAll() => reference.orderBy('startingTime').get();

  @override
  Future<List<Session>> getAllAsModel() async {
    _sessions = <Session>[];

    final querySnapshot = await getAll();

    for (final documentSnapshot in querySnapshot.docs) {
      final session = Session.fromSnapshot(documentSnapshot);

      _sessions.add(session);
    }
    return _sessions;
  }
}
