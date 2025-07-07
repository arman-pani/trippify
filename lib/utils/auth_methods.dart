import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthMethods {
  final _authInstance = FirebaseAuth.instance;

  Future<String?> loginWithEmail(String email, String password) async {
    try {
      final credentials = await _authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credentials.user!.uid;
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      return null;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      final credentials = await _authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credentials.user!.uid;
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      return null;
    } catch (error) {
      debugPrint(error.toString());
      return null;
    }
  }
}
