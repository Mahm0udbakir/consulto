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

class SignOut {
  final FirebaseAuth auth;

  SignOut(this.auth);

  Future<Either<Failure, void>> call() async {
    try {
      await auth.signOut();
      return const Right(null); // Ensure it returns Right(null) instead of void
    } catch (e) {
      return Left(Failure(e.toString())); // Return Left on failure
    }
  }
}

class SignUp {
  final AuthRepository repository;
  SignUp(this.repository);

  Future<Either<Failure, User?>> call(String email, String password) {
    return repository.signUp(email, password);
  }
}

class GetUserStream {
  final AuthRepository repository;
  GetUserStream(this.repository);

  Stream<User?> call() {
    return repository.userStream;
  }
}
