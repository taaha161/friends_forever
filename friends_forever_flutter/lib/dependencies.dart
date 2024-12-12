import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:friends_forever_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/current_user.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/email_verification.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/login.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/logout.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/register_user.dart';
import 'package:friends_forever_flutter/features/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:friends_forever_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'features/auth/data/repository/auth_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton<UserCubit>(() => UserCubit());
  serviceLocator.registerLazySingleton<Client>(
    () => Client(
      "http://localhost:8080/",
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor(),
  );
  serviceLocator.registerLazySingleton<SessionManager>(
    () => SessionManager(
      caller: serviceLocator<Client>().modules.auth,
    ),
  );
  await serviceLocator<SessionManager>().initialize();
  _initAuthDependencies();
}

_initAuthDependencies() {
  serviceLocator.registerFactory<AuthDatasource>(() => AuthDataSourceImpl(
      sessionManager: serviceLocator<SessionManager>(),
      client: serviceLocator<Client>()));
  // Repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator<AuthDatasource>(),
    ),
  );

  // Use Cases

  serviceLocator.registerFactory<CurrentUserUseCase>(
    () => CurrentUserUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );

  serviceLocator.registerFactory<LoginUseCase>(
    () => LoginUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );

  serviceLocator.registerFactory<RegisterUserUseCase>(
    () => RegisterUserUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );

  serviceLocator.registerFactory<EmailVerificationUseCase>(
    () => EmailVerificationUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );

  serviceLocator.registerFactory<LogoutUseCase>(
    () => LogoutUseCase(
      serviceLocator<AuthRepository>(),
    ),
  );

  // Bloc

  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userCubit: serviceLocator<UserCubit>(),
      loginUseCase: serviceLocator<LoginUseCase>(),
      currentUserUseCase: serviceLocator<CurrentUserUseCase>(),
      logoutUseCase: serviceLocator<LogoutUseCase>(),
      registerUserUseCase: serviceLocator<RegisterUserUseCase>(),
      emailVerificationUseCase: serviceLocator<EmailVerificationUseCase>(),
    ),
  );
}
