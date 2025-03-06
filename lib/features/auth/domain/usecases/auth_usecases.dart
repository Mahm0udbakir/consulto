import 'package:consulto/core/errors/failure.dart';
import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// 🔹 **Sign In**
class SignIn {
  final AuthRepository repository;
  SignIn(this.repository);

  Future<Either<Failure, User?>> call(String email, String password) async {
    return await repository.signIn(email, password);
  }
}

/// 🔹 **Sign Up**
class SignUp {
  final AuthRepository repository;
  SignUp(this.repository);

  Future<Either<Failure, User?>> call(String email, String password) async {
    return await repository.signUp(email, password);
  }
}

class SignOut {
  final AuthRepository repository;
  SignOut(this.repository);

  Future<Either<Failure, Unit>> call() async {
    try {
      await repository.signOut();
      return right(unit); // ✅ Return Unit instead of void
    } catch (e) {
      return left(Failure(e.toString())); // Return Failure on error
    }
  }
}

/// 🔹 **Get User Stream**
class GetUserStream {
  final AuthRepository repository;
  GetUserStream(this.repository);

  Stream<User?> call() {
    return repository.userStream;
  }
}
