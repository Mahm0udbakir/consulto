import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';

class SignOut {
  final AuthRepository repository;
  SignOut(this.repository);

  Future<void> call() {
    return repository.signOut();
  }
}