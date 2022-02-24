import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/logic/database_repository.dart';
import 'package:festival_flutterturkiye_org/core/model/sponsor.dart';

class SponsorRepository extends DatabaseRepository<Sponsor> {
  SponsorRepository() : super('sponsors');

  List<Sponsor> _sponsors = [];

  List<Sponsor> get sponsors => _sponsors;

  List<Sponsor> get goldSponsors => _sponsors
      .where((sponsor) => sponsor.type == SponsorType.gold)
      .toList(growable: false);

  List<Sponsor> get silverSponsors => _sponsors
      .where((sponsor) => sponsor.type == SponsorType.silver)
      .toList(growable: false);

  List<Sponsor> get bronzSponsors => _sponsors
      .where((sponsor) => sponsor.type == SponsorType.bronze)
      .toList(growable: false);

  List<Sponsor> get mediaSponsors => _sponsors
      .where((sponsor) => sponsor.type == SponsorType.media)
      .toList(growable: false);

  @override
  Future<QuerySnapshot> getAll() =>
      reference.where('isActive', isEqualTo: true).orderBy('order').get();

  @override
  Future<List<Sponsor>> getAllAsModel() async {
    _sponsors = <Sponsor>[];
    final querySnapshot = await getAll();

    for (final documentSnapshot in querySnapshot.docs) {
      final sponsor = Sponsor.fromSnapshot(documentSnapshot);

      _sponsors.add(sponsor);
    }
    return _sponsors;
  }
}
