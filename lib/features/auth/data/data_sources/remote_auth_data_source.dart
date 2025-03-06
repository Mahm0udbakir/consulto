import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signUp(String email, String password);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Stream<User?> get userStream;
}

class FirebaseAuthDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User signed up: ${userCredential.user?.email}");
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("❌ Sign-up error: ${e.code} - ${e.message}");
      throw Exception("Sign-up failed: ${e.message}");
    }
  }

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User signed in: ${userCredential.user?.email}");
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("❌ Sign-in error: ${e.code} - ${e.message}");
      throw Exception("Sign-in failed: ${e.message}");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("✅ User signed out");
    } catch (e) {
      print("❌ Error signing out: $e");
      throw Exception("Sign-out failed");
    }
  }

  @override
  Stream<User?> get userStream => _auth.authStateChanges();
}
