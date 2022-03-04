import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/logic/database_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/speaker.dart';

class SpeakerRepository extends DatabaseRepository<Speaker> {
  SpeakerRepository() : super('speakers');

  List<Speaker> _speakers = [];

  List<Speaker> get speakers => _speakers;

  @override
  Future<QuerySnapshot> getAll() => reference.orderBy('name').get();

  @override
  Future<List<Speaker>> getAllAsModel() async {
    _speakers = <Speaker>[];
    final querySnapshot = await getAll();

    for (final documentSnapshot in querySnapshot.docs) {
      final speaker = Speaker.fromSnapshot(documentSnapshot);

      _speakers.add(speaker);
    }
    return _speakers;
  }
}
