import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:meeps/global/user_details.dart';
import 'package:meeps/networking/api.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meeps/models/user_model.dart' as UserModel;
import 'package:meeps/networking/user_authentication.dart';

class AuthenticationProvider extends ChangeNotifier {
  UserModel.User _userModel = UserModel.User();

  UserModel.User get userModel => _userModel;

  set userModel(UserModel.User userModel) {
    _userModel = userModel;
  }

  Authentication authentication = Authentication();
  Future<User?> userSignup(String email, String password) async {
    User? user = await authentication.register(email, password);
    return user;
  }

  Future<bool> userSignin(String email, String password) async {
    bool check = false;
    try {
      User? user =
          await authentication.signInWithEmailAndPassword(email, password);
      if (user != null) {
        notifyListeners();
        check = true;
      } else {
        notifyListeners();
        check = false;
      }
    } catch (e) {
      print(e);
    }
    return check;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  bool checkPasswordLenght(String password) {
    if ((password.trim().isNotEmpty) && (password.trim().length >= 8)) {
      return true;
    }
    return false;
  }

  bool matchPassword(String password, String confirmPassword) {
    if (password.trim() == confirmPassword.trim()) {
      return true;
    }
    return false;
  }

  bool checkTermsAndConditions(List<dynamic> checkTerms) {
    bool check = true;
    for (var item in checkTerms) {
      if (!item['selected']) {
        check = false;
        break;
      }
    }
    return check;
  }

  bool checkValidPassword(String password, String confirmPassword) {
    bool check = false;
    if (checkPasswordLenght(password)) {
      if (matchPassword(password, confirmPassword)) {
        check = true;
      }
    }
    return check;
  }

  String getCurrentUser() {
    String userid = '';
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? user = _auth.currentUser;
    userid = user!.uid;
    return userid;
  }

  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } catch (error) {
      // Handle error
      // ...
      return true;
    }
  }

  Future<DocumentSnapshot> getUserDetailsFromId(String userId) async {
    DocumentSnapshot<Object?> ref =
        await Api("users_profile").getDocumentById(userId);
    notifyListeners();
    return ref;
  }

  Future<String> uploadFile(File? _image, String userId) async {
    FirebaseStorage storageReference = FirebaseStorage.instance;
    Reference ref = storageReference
        .ref()
        .child('users/$userId/${Path.basename(_image!.path)}');
    UploadTask uploadTask = ref.putFile(_image);
    await uploadTask.whenComplete(() => null);
    print('File Uploaded');
    String returnURL = '';
    await ref.getDownloadURL().then((fileURL) {
      returnURL = fileURL;
    });
    return returnURL;
  }

  Future<bool> createUser(UserModel.User users) async {
    User? user =
        await userSignup(users.email.toString(), users.password.toString());
    String? profileImageUrl = await uploadFile(users.profileImage, user!.uid);
    Map<String, dynamic> data = {
      'id': user.uid,
      'user_name': users.name,
      'user_id': users.userId,
      'user_email': users.email,
      'user_bio': users.bio,
      'user_bio_tag': users.bioTag,
      'user_date_of_birth': users.dateOfBirth,
      'user_nationality': users.nationality,
      'user_introduction': users.userIntroduction,
      'user_name_id': users.id,
      'user_profile_image_url': profileImageUrl,
      'sign_in_method': 'email',
      'following': [],
      'followedBy': []
    };
    DocumentSnapshot<Object?> ref =
        await Api("users_profile").addDocument(user.uid, data);
    if (ref.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createUserWithFacebook(UserModel.User users) async {
    Map<String, dynamic> data = {
      'id': users.id,
      'user_name': users.name,
      'user_id': users.userId,
      'user_email': users.email,
      'user_bio': users.bio,
      'user_bio_tag': users.bioTag,
      'user_date_of_birth': users.dateOfBirth,
      'user_nationality': users.nationality,
      'user_introduction': users.userIntroduction,
      'user_profile_image_url': users.profileImageUrl,
      'sign_in_method': 'facebook'
    };
    DocumentSnapshot<Object?> ref =
        await Api("users_profile").addDocument(users.id!, data);
    if (ref.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createUserWithGoogle(UserModel.User users) async {
    UserDetails.userId = users.id.toString();
    Map<String, dynamic> data = {
      'id': users.id,
      'user_name': users.name,
      'user_id': users.userId,
      'user_email': users.email,
      'user_bio': users.bio,
      'user_bio_tag': users.bioTag,
      'user_date_of_birth': users.dateOfBirth,
      'user_nationality': users.nationality,
      'user_introduction': users.userIntroduction,
      'user_profile_image_url': users.profileImageUrl,
      'sign_in_method': 'google',
      'following': [],
      'followedBy': [],
    };
    DocumentSnapshot<Object?> ref =
        await Api("users_profile").addDocument(users.id!, data);
    if (ref.id.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateUserProfile(UserModel.User users) async {
    String? profileImageUrl = '';
    Map<String, Object?> data = {};
    if (users.profileImage != null) {
      await deletePreviousProfileImageFile(users.id);
      profileImageUrl = await uploadFile(users.profileImage, users.userId!);
      data = {
        'id': users.id,
        'user_bio_tag': users.bioTag,
        'user_date_of_birth': users.dateOfBirth,
        'user_nationality': users.nationality,
        'user_introduction': users.userIntroduction,
        'user_profile_image_url': profileImageUrl,
      };
    } else {
      data = {
        'id': users.id,
        'user_bio_tag': users.bioTag,
        'user_date_of_birth': users.dateOfBirth,
        'user_nationality': users.nationality,
        'user_introduction': users.userIntroduction,
      };
      await Api("users_profile").updateDocument(data, users.userId!);
    }
  }

  Future<void> deletePreviousProfileImageFile(String? user_id) async {
    DocumentSnapshot<Object?> snapshot01 = await getUserDetailsFromId(user_id!);
    FirebaseStorage storageReference = FirebaseStorage.instance;
    storageReference
        .refFromURL(snapshot01.get('user_profile_image_url'))
        .delete();
  }

  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    User? user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    notifyListeners();
    return user;
  }

  Future<UserCredential> signInWithFacebook() async {
    // try {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    //   }on FacebookAuthException catch (e) {
    //   switch (e.errorCode) {
    //       case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
    //         print("You have a previous login operation in progress");
    //         break;
    //       case FacebookAuthErrorCode.CANCELLED:
    //         print("login cancelled");
    //         break;
    //       case FacebookAuthErrorCode.FAILED:
    //         print("login failed");
    //         break;
    //   }
    // }
  }
}
