import 'package:consulto/core/errors/failure.dart';
import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn {
  final AuthRepository repository;
  SignIn(this.repository);

  Future<Either<Failure, User?>> call(String email, String password) {
    return repository.signIn(email, password);
  }
}