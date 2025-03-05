import 'package:consulto/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<Either<Failure,User?>> signUp(String email, String password);
  Future<Either<Failure,User?>> signIn(String email, String password);
  Future<void> signOut();
  Stream<User?> get userStream;
}

//! The Either is from dartz package which allows two return types