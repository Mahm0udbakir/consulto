import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserStream {
  final AuthRepository repository;
  GetUserStream(this.repository);

  Stream<User?> call() {
    return repository.userStream;
  }
}
