import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInWithAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
}
