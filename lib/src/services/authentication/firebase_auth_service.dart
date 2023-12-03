import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'auth_service.dart';

class FirebaseAuthService implements AnonymousAuthService {
  @override
  Future<bool> login() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Failed to sign in anonymously: $e');
      }

      rethrow;
    }
  }

  @override
  void logout() => FirebaseAuth.instance.signOut();

  @override
  bool isLoggedIn() => FirebaseAuth.instance.currentUser != null;

  @override
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
}
