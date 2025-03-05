import 'package:bloc/bloc.dart';
import 'package:consulto/features/auth/domain/usecases/auth_usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<User?> {
  final SignUp signUpUseCase;
  final SignIn signInUseCase;
  final SignOut signOutUseCase;
  final GetUserStream userStreamUseCase;

  AuthCubit({
    required this.signUpUseCase,
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.userStreamUseCase,
  }) : super(null) {
    userStreamUseCase().listen((user) => emit(user));
  }

  Future<void> signUp(String email, String password) async {
    User? user = await signUpUseCase(email, password);
    emit(user);
  }

  Future<void> signIn(String email, String password) async {
    User? user = await signInUseCase(email, password);
    emit(user);
  }

  Future<void> signOut() async {
    await signOutUseCase();
    emit(null);
  }
}
