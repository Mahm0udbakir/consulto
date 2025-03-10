import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:consulto/core/routes/router_generator.dart';
import 'package:consulto/core/service_locator.dart';
import 'package:consulto/features/auth/data/data_sources/firebase_auth_service.dart';
import 'package:consulto/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:consulto/features/auth/domain/usecases/auth_usecases.dart';
import 'package:consulto/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:consulto/core/connection/network_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("✅ Firebase initialized successfully");
  } catch (e) {
    print("❌ Firebase initialization error: $e");
  }

  // ✅ Initialize services
  final firebaseAuthService = FirebaseAuthService();
  final networkInfo = NetworkInfoImpl(Connectivity());
  final authRepository = AuthRepositoryImpl(firebaseAuthService, networkInfo);
  setupServiceLocator(); // 👈 Ensure services are registered before running the app

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  const MyApp({super.key, required this.authRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        signUpUseCase: SignUp(authRepository),
        signInUseCase: SignIn(authRepository),
        signOutUseCase: SignOut(authRepository),
        userStreamUseCase: GetUserStream(authRepository),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
