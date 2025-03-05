import 'package:flutter/foundation.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
