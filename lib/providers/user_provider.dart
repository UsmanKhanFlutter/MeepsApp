import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meeps/models/user_model.dart';
import 'package:meeps/networking/api.dart';
import 'package:meeps/providers/post_provider.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  User _user = User();

  User get user => _user;

  set user(User user) {
    _user = user;
  }

  Future<void> followUsers(
      String following, String followedBy, BuildContext context) async {
    final postProvider = Provider.of<PostProvider>(context, listen: false);

    DocumentSnapshot<Object?> snapshot01 =
        await postProvider.getUserDetailsFromId(following);
    //print(snapshot01.data());
    DocumentSnapshot<Object?> snapshot02 =
        await postProvider.getUserDetailsFromId(followedBy);
    if (snapshot02.get('followedBy').contains(following)) {
      Map<String, Object?> data01 = {
        'followedBy': FieldValue.arrayRemove([following])
      };
      await Api("users_profile").updateDocument(data01, followedBy);

      Map<String, Object?> data02 = {
        'following': FieldValue.arrayRemove([followedBy])
      };
      await Api("users_profile").updateDocument(data02, following);
    } else {
      Map<String, Object?> data01 = {
        'followedBy': FieldValue.arrayUnion([following])
      };
      await Api("users_profile").updateDocument(data01, followedBy);
      Map<String, Object?> data02 = {
        'following': FieldValue.arrayUnion([followedBy])
      };
      await Api("users_profile").updateDocument(data02, following);
    }
    // Map<String, Object?> data = {
    //   'followedBy': FieldValue.arrayUnion([following])
    // };
    // await Api("users_profile").updateDocument(data, followedBy);
    // print(following);
    // print(followedBy);
  }
}
