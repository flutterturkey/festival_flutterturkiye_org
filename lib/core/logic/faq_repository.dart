import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festival_flutterturkiye_org/core/logic/database_repository.dart';
import 'package:festival_flutterturkiye_org/faq/model/faq.dart';

class FaqRepository extends DatabaseRepository<FAQ> {
  FaqRepository() : super('faqs');

  List<FAQ> _faqs = [];

  List<FAQ> get faqs => _faqs;

  @override
  Future<QuerySnapshot> getAll() => reference.orderBy('order').get();

  @override
  Future<List<FAQ>> getAllAsModel() async {
    _faqs = <FAQ>[];
    final querySnapshot = await getAll();

    for (final documentSnapshot in querySnapshot.docs) {
      final faq = FAQ.fromSnapshot(documentSnapshot);

      _faqs.add(faq);
    }
    return _faqs;
  }
}
