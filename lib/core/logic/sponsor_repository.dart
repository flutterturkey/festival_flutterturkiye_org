import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/logic/database_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/sponsor.dart';

class SponsorRepository extends DatabaseRepository<Sponsor> {
  SponsorRepository() : super('sponsors');

  List<Sponsor> _sponsors = [];

  List<Sponsor> get speakers => _sponsors;

  @override
  Future<QuerySnapshot> getAll() => reference.orderBy('name').get();

  @override
  Future<List<Sponsor>> getAllAsModel() async {
    _sponsors = <Sponsor>[];
    final querySnapshot = await getAll();

    for (final documentSnapshot in querySnapshot.docs) {
      final speaker = Sponsor.fromSnapshot(documentSnapshot);

      if (speaker != null) {
        _sponsors.add(speaker);
      }
    }
    return _sponsors;
  }
}
