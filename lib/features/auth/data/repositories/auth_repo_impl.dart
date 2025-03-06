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

/**
 * 
 local_auth_data_source.dart
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserData(String id, String email);
  Future<Map<String, String>?> getUserData();
  Future<void> clearUserData();
  Stream<bool> get authStateChanges;
}

class LocalAuthDataSource implements AuthLocalDataSource {
  static const String _userIdKey = 'USER_ID';
  static const String _userEmailKey = 'USER_EMAIL';

  final StreamController<bool> _authStateController = StreamController<bool>.broadcast();

  LocalAuthDataSource() {
    _loadAuthState();
  }

  // Save user data (called during sign-in or sign-up)
  @override
  Future<void> saveUserData(String id, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, id);
    await prefs.setString(_userEmailKey, email);
    _authStateController.add(true); // Emit authenticated state
    print("✅ User data saved locally: $email");
  }

  // Get stored user data
  @override
  Future<Map<String, String>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(_userIdKey);
    String? email = prefs.getString(_userEmailKey);

    if (id != null && email != null) {
      return {'id': id, 'email': email};
    }
    return null;
  }

  // Clear user data (called during sign-out)
  @override
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_userEmailKey);
    _authStateController.add(false); // Emit signed-out state
    print("✅ User signed out locally");
  }

  // Stream for authentication state changes
  @override
  Stream<bool> get authStateChanges => _authStateController.stream;

  // Load authentication state on initialization
  Future<void> _loadAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getString(_userIdKey) != null;
    _authStateController.add(isLoggedIn);
  }
}

remote_auth_data_source.dart
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signUp(String email, String password);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Stream<User?> get userStream;
}

class FirebaseAuthDataSource implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User signed up: ${userCredential.user?.email}");
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("❌ Sign-up error: ${e.code} - ${e.message}");
      throw Exception("Sign-up failed: ${e.message}");
    }
  }

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User signed in: ${userCredential.user?.email}");
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print("❌ Sign-in error: ${e.code} - ${e.message}");
      throw Exception("Sign-in failed: ${e.message}");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("✅ User signed out");
    } catch (e) {
      print("❌ Error signing out: $e");
      throw Exception("Sign-out failed");
    }
  }

  @override
  Stream<User?> get userStream => _auth.authStateChanges();
}
 */