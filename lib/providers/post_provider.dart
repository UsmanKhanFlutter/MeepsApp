import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/networking/api.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:meeps/models/post_model.dart';

class PostProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Post _post = Post();

  Post get post => _post;

  set post(Post post) {
    _post = post;
  }

  Future<List<String>> uploadFiles(List<File> _images, String userId) async {
    var imageUrls =
        await Future.wait(_images.map((_image) => uploadFile(_image, userId)));
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadFile(File? _image, String? userId) async {
    FirebaseStorage storageReference = FirebaseStorage.instance;
    Reference ref = storageReference
        .ref()
        .child('users/posts/$userId/${Path.basename(_image!.path)}');
    UploadTask uploadTask = ref.putFile(_image);
    await uploadTask.whenComplete(() => null);
    print('File Uploaded');
    String returnURL = '';
    await ref.getDownloadURL().then((fileURL) {
      returnURL = fileURL;
    });
    return returnURL;
  }

  Future<bool> createPost(Post post) async {
    List<String?> postImagesUrls =
        await uploadFiles(post.postPhotos, UserDetails.userId);
    Map<String, dynamic> data = {
      'user_id': UserDetails.userId,
      'post_title': post.postTitle,
      'post_travel_place': post.travelPlace,
      'post_travel_date_time': post.travelDateTime,
      'post_pictures_title': post.titleOfPicture,
      'post_images_urls': postImagesUrls,
    };
    DocumentSnapshot<Object?> ref =
        await Api("posts").addDocument(UserDetails.userId, data);
    if (ref.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<DocumentSnapshot> getUserDetailsFromId(String userId) async {
    DocumentSnapshot<Object?> ref =
        await Api("users_profile").getDocumentById(userId);
    notifyListeners();
    return ref;
  }
}
