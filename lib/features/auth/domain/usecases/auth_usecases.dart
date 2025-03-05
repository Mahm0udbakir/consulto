import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp {
  final AuthRepository repository;
  SignUp(this.repository);

  Future<User?> call(String email, String password) {
    return repository.signUp(email, password);
  }
}

class SignIn {
  final AuthRepository repository;
  SignIn(this.repository);

  Future<User?> call(String email, String password) {
    return repository.signIn(email, password);
  }
}

class SignOut {
  final AuthRepository repository;
  SignOut(this.repository);

  Future<void> call() {
    return repository.signOut();
  }
}

class GetUserStream {
  final AuthRepository repository;
  GetUserStream(this.repository);

  Stream<User?> call() {
    return repository.userStream;
  }
}
