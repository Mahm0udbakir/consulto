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
