import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

/// Initial State
class AuthInitial extends AuthState {}

/// Sign Up States
class SignUpLoading extends AuthState {}
class SignUpSuccess extends AuthState {
  final User user;
  SignUpSuccess(this.user);
}
class SignUpFailure extends AuthState {
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}

/// Sign In States
class SignInLoading extends AuthState {}
class SignInSuccess extends AuthState {
  final User user;
  SignInSuccess(this.user);
}
class SignInFailure extends AuthState {
  final String errorMessage;
  SignInFailure(this.errorMessage);
}

/// Sign Out States
class SignOutLoading extends AuthState {}
class SignOutSuccess extends AuthState {}
class SignOutFailure extends AuthState {
  final String errorMessage;
  SignOutFailure(this.errorMessage);
}

/// User Stream States
class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}
class Unauthenticated extends AuthState {}
