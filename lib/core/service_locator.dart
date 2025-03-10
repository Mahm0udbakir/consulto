import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:consulto/core/connection/network_info.dart';
import 'package:consulto/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:consulto/features/auth/data/data_sources/firebase_auth_service.dart';
import 'package:consulto/features/auth/domain/repositories/auth_repositories.dart';
import 'package:consulto/features/auth/domain/usecases/auth_usecases.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Register Core Dependencies  // Register Core Dependencies
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl<Connectivity>()));

  // Register Data Sources
  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  // Register Repository Implementation with Required Dependencies
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<FirebaseAuthService>(), sl<NetworkInfo>()),
  );

  // Register Use Cases
  sl.registerLazySingleton<SignIn>(() => SignIn(sl<AuthRepository>()));
  sl.registerLazySingleton<SignUp>(() => SignUp(sl<AuthRepository>()));
}
