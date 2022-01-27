import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  CollectionReference? ref;

  Api(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref!.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref!.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref!.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref!.doc(id).delete();
  }

  Future<DocumentSnapshot> addDocument(String userId, Map data) {
    ref!.doc(userId).set(data);
    return ref!.doc(userId).get();
  }

  Future<void> updateDocument(Map<String, Object?> data, String id) {
    return ref!.doc(id).update(data);
  }

  Future<void> updateArrayDocument(Map<String, Object?> data, String id) {
    return ref!.doc(id).update(data);
  }
}
