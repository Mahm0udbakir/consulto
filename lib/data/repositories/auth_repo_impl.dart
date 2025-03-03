import 'package:consulto/data/data_sources/auth_services.dart';
import 'package:consulto/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
  
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl(this.firebaseAuthService);

  @override
  Future<User?> signUp(String email, String password) {
    return firebaseAuthService.signUp(email, password);
  }

  @override
  Future<User?> signIn(String email, String password) {
    return firebaseAuthService.signIn(email, password);
  }

  @override
  Future<void> signOut() {
    return firebaseAuthService.signOut();
  }

  @override
  Stream<User?> get userStream {
    return firebaseAuthService.userStream;
  }
}
