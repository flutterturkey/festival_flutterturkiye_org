import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class DatabaseRepository<DatabaseModel> {
  DatabaseRepository(String collection)
      : assert(collection != null),
        _collection = collection;

  /// Firebase Collection Name
  final String _collection;

  @protected
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference get reference => firestore.collection(_collection);

  Future<DocumentSnapshot> get(String documentId);
  Future<QuerySnapshot> getAll();

  Future<List<DatabaseModel>> getAllAsModel();
}
