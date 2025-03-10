import 'package:consulto/core/connection/network_info.dart';
import 'package:consulto/core/errors/failure.dart';
import 'package:consulto/features/auth/data/data_sources/firebase_auth_service.dart';
import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl(this.firebaseAuthService, this.networkInfo);

  @override
  Future<Either<Failure, User?>> signUp(String email, String password) {
    return firebaseAuthService.signUp(email, password);
  }

  @override
  Future<Either<Failure, User?>> signIn(String email, String password) async {
    if (await networkInfo.isConnected) {
      return firebaseAuthService.signIn(email, password);
    } else {
      return Left(Failure());
    }
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
