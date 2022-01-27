import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/models/meepstv_model.dart';
import 'package:meeps/networking/api.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:meeps/models/post_model.dart';

class MeepsTvProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MeepsTv _meepsTv = MeepsTv();

  MeepsTv get meepsTv => _meepsTv;

  set meepsTv(MeepsTv meepsTv) {
    _meepsTv = meepsTv;
  }

  Future<QuerySnapshot> getTvDetails() {
    notifyListeners();
    return Api('admin_meeps_tv').getDataCollection();
  }
}
