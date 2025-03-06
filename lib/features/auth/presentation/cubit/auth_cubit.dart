import 'package:bloc/bloc.dart';
import 'package:consulto/core/errors/failure.dart';
import 'package:consulto/features/auth/domain/usecases/auth_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUp signUpUseCase;
  final SignIn signInUseCase;
  final SignOut signOutUseCase;
  final GetUserStream userStreamUseCase;

  AuthCubit({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.userStreamUseCase,
  }) : super(AuthInitial()) {
    userStreamUseCase().listen((user) {
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    });
  }

  /// 🔹 **Sign Up**
  Future<void> signUp(String email, String password) async {
    emit(SignUpLoading()); // Emit loading state

    Either<Failure, User?> result = await signUpUseCase(email, password);

    result.fold(
      (failure) {
        print("❌ Sign-up failed: ${failure.toString()}");
        emit(SignUpFailure(failure.toString())); // Emit failure state
      },
      (user) {
        if (user != null) {
          print("✅ Signed up successfully as ${user.email}");
          emit(SignUpSuccess(user)); // Emit success state
        } else {
          print("❌ Sign-up failed: No user returned");
          emit(SignUpFailure("Sign-up failed"));
        }
      },
    );
  }

  /// 🔹 **Sign In**
  Future<void> signIn(String email, String password) async {
    emit(SignInLoading()); // Emit loading state

    Either<Failure, User?> result = await signInUseCase(email, password);

    result.fold(
      (failure) {
        print("❌ Sign-in failed: ${failure.toString()}");
        emit(SignInFailure(failure.toString())); // Emit failure state
      },
      (user) {
        if (user != null) {
          print("✅ Signed in successfully as ${user.email}");
          emit(SignInSuccess(user)); // Emit success state
        } else {
          print("❌ Sign-in failed: No user returned");
          emit(SignInFailure("Sign-in failed"));
        }
      },
    );
  }

Future<void> signOut() async {
  emit(SignOutLoading()); // Emit loading state

  final Either<Failure, void> result = await signOutUseCase();  // Ensure it returns Either<Failure, void>

  result.fold(
    (failure) {
      print("❌ Sign-out failed: ${failure.toString()}");
      emit(SignOutFailure(failure.toString())); // Emit failure state
    },
    (_) {
      print("✅ Signed out successfully");
      emit(SignOutSuccess()); // Emit success state
    },
  );
}
}
