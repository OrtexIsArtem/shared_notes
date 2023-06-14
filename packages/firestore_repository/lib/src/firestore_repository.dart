import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  static final FirestoreRepository _instance = FirestoreRepository._internal();

  factory FirestoreRepository() => _instance;

  FirestoreRepository._internal();

  final firestore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.doc(path);
    developer.log('$path: $data');
    await reference.set(data);
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.doc(path);
    await reference.update(data);
  }

  Future<void> setNotificationFunction({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = firestore.collection(path).doc(data['id']);
    developer.log('$path: $data');
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = firestore.doc(path);
    developer.log('delete: $path');
    await reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    var query = firestore.collection(path);

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }

      return result;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentID) builder,
  }) {
    final reference = firestore.doc(path);
    var snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data()!, snapshot.id));
  }
}
