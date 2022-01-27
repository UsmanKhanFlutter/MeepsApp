import 'package:firebase_auth/firebase_auth.dart';
import 'package:meeps/global/user_details.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> register(String email, String password) async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;
    UserDetails.userId = user!.uid;
    return user;
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final User user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user!;
    UserDetails.userId = user.uid;
    return user;
  }
}
