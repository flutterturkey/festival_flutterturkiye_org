import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/logic/database_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/session.dart';

class SessionRepository extends DatabaseRepository<Session> {
  SessionRepository() : super('sessions');

  @override
  Future<DocumentSnapshot> get(String documentId) =>
      reference.doc(documentId).get();

  @override
  Future<QuerySnapshot> getAll() => reference.orderBy('startingTime').get();

  @override
  Future<List<Session>> getAllAsModel() async {
    final models = <Session>[];
    final querySnapshot = await getAll();

    for (final documentSnapshot in querySnapshot.docs) {
      final session = Session.fromMap(documentSnapshot.data());

      if (session != null) {
        models.add(session);
      }
    }

    return models;
  }
}
