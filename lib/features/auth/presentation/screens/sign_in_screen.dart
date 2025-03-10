import 'package:consulto/core/routes/app_routes.dart';
import 'package:consulto/core/errors/failure.dart';
import 'package:consulto/features/auth/domain/usecases/auth_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  final SignIn signIn;
  final SignUp signUp;

  const SignInScreen({
    Key? key,
    required this.signIn,
    required this.signUp,
  }) : super(key: key);

  Duration get loadingTime => const Duration(milliseconds: 2000);

  /// Handles user authentication for sign in.
  Future<String?> _authUser(BuildContext context, LoginData data) async {
    Either<Failure, User?> result =
        await signIn(data.name, data.password);
    return result.fold(
      (failure) => failure.errMessage,
      (user) {
        if (user != null) {
          // Navigate to home using GoRouter after a successful login.
          Future.microtask(() => context.go(AppRoutes.home));
          return null;
        } else {
          return 'Sign in failed: No user returned';
        }
      },
    );
  }

  /// Handles user registration.
  Future<String?> _signupUser(BuildContext context, SignupData data) async {
    Either<Failure, User?> result =
        await signUp(data.name!, data.password!);
    return result.fold(
      (failure) => failure.errMessage,
      (user) {
        if (user != null) {
          Future.microtask(() => context.go(AppRoutes.home));
          return null;
        } else {
          return 'Sign up failed: No user returned';
        }
      },
    );
  }

  /// Handles password recovery.
  Future<String?> _recoveryPassword(String name) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: name);
      return null;
    } catch (e) {
      return 'Password recovery failed: ${e.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'Consulto',
        logo: const AssetImage('assets/logo.jpg'),
        theme: LoginTheme(
          pageColorLight: Colors.green,
          pageColorDark: Colors.green,
          primaryColor: Colors.black,
          accentColor: Colors.black,
          buttonTheme: const LoginButtonTheme(
            backgroundColor: Colors.black,
            highlightColor: Colors.black,
            elevation: 5.0,
          ),
        ),
        termsOfService: [
          TermOfService(
            id: 'terms',
            mandatory: true,
            text: 'Terms & Conditions',
            linkUrl: 'https://yourwebsite.com/terms',
          ),
          TermOfService(
            id: 'privacy',
            mandatory: true,
            text: 'Privacy Policy',
            linkUrl: 'https://yourwebsite.com/privacy',
          ),
        ],
        onLogin: (LoginData data) => _authUser(context, data),
        onSignup: (SignupData data) => _signupUser(context, data),
        onRecoverPassword: _recoveryPassword,
      ),
    );
  }
}
