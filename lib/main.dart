import 'package:consulto/data/data_sources/auth_services.dart';
import 'package:consulto/data/repositories/auth_repo_impl.dart';
import 'package:consulto/domain/repositories/auth_repositories.dart';
import 'package:consulto/presentation/cubit/auth_cubit/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'domain/usecases/auth_usecases.dart';
import 'presentation/screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final firebaseAuthService = FirebaseAuthService();
  final authRepository = AuthRepositoryImpl(firebaseAuthService);

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  MyApp({required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        signUpUseCase: SignUp(authRepository),
        signInUseCase: SignIn(authRepository),
        signOutUseCase: SignOut(authRepository),
        userStreamUseCase: GetUserStream(authRepository),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
