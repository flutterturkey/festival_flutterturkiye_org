import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/logic/database_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';

class SpeakerRepository extends DatabaseRepository<Speaker> {
  SpeakerRepository() : super('speakers');

  @override
  Future<DocumentSnapshot> get(String documentId) =>
      reference.doc(documentId).get();

  @override
  Future<QuerySnapshot> getAll() => reference.orderBy('name').get();

  @override
  Future<List<Speaker>> getAllAsModel() async {
    final querySnapshot = await getAll();
    final models = <Speaker>[];

    for (final documentSnapshot in querySnapshot.docs) {
      final speaker = Speaker.fromMap(documentSnapshot.data());

      if (speaker != null) {
        models.add(speaker);
      }
    }

    return models;
  }
}
