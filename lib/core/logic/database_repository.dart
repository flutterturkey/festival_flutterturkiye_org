import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class DatabaseRepository<DatabaseModel> {
  DatabaseRepository(String collection)
      : _collection = collection,
        _firestore = FirebaseFirestore.instance;

  /// Firebase Collection Name
  final String _collection;

  @protected
  final FirebaseFirestore _firestore;

  CollectionReference get reference => _firestore.collection(_collection);

  Future<DocumentSnapshot> get(String documentId) =>
      reference.doc(documentId).get();
  Future<QuerySnapshot> getAll();

  /// It should save the model list as a field in the repository
  /// to store all the data.
  Future<List<DatabaseModel>> getAllAsModel();
}
