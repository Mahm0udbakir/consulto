import 'package:consulto/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User signed up: ${userCredential.user?.email}");
      return userCredential.user;
    } catch (e) {
      print("❌ Error in signUp: $e");
      return null;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User signed in: ${userCredential.user?.email}");
      return userCredential.user;
    } catch (e) {
      print("❌ Error in signIn: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    print("✅ User signed out");
  }

  Stream<User?> get userStream {
    return _auth.authStateChanges();
  }
}
