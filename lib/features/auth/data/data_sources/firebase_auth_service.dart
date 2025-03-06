import 'package:firebase_auth/firebase_auth.dart';
import 'package:consulto/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<Failure, User?>> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential.user);
    } catch (e) {
      return Left(Failure());

    }
  }

  Future<Either<Failure, User?>> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential.user);
    } catch (e) {
      return Left(Failure());

    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get userStream => _firebaseAuth.authStateChanges();
}
