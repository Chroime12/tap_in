import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;

      if (user != null && !user.emailVerified) {
        throw Exception('Email not verified');
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw Exception('Invalid credentials');
      }
    }

    return null;
  }

  Future<User?> signUp(String username, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;

      if (user != null) {
        await user.sendEmailVerification();
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
        });
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Email already in use');
      }
    }
    return null;
  }
}
