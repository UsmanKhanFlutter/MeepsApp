import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meeps/networking/api.dart';

class ProfileProvider extends ChangeNotifier {
  Future<DocumentSnapshot> getUserProfileDetails(String userId) {
    notifyListeners();
    return Api('users_profile').getDocumentById(userId);
  }
}
