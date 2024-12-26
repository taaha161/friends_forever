import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/features/apologies/data/data_sources/apology_data_source.dart';
import 'package:friends_forever_flutter/features/apologies/data/repository/apology_repository.dart';
import 'package:friends_forever_flutter/features/apologies/domain/repositories/apology_repository.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/delete_apology_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/get_apology_by_id.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/get_recieved_apologies_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/get_sent_apologies_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/send_apology_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/usecases/update_apology_usecase.dart';
import 'package:friends_forever_flutter/features/apologies/presentation/bloc/apology_bloc.dart';
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
      "http://10.0.2.2:8080/",
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
  //  Data Source
  serviceLocator.registerFactory<AuthDatasource>(() => AuthDataSourceImpl(
      sessionManager: serviceLocator<SessionManager>(),
      client: serviceLocator<Client>()));

  serviceLocator.registerFactory<ApologyDataSource>(() => ApologyDataSourceImpl(
      client: serviceLocator<Client>(),
      sessionManager: serviceLocator<SessionManager>()));

  //  Repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator<AuthDatasource>(),
    ),
  );
  serviceLocator.registerFactory<ApologyRepository>(() => ApologyRepositoryImpl(
        dataSource: serviceLocator<ApologyDataSource>(),
      ));

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

  serviceLocator.registerFactory<GetApologyByIdUseCase>(
      () => GetApologyByIdUseCase(serviceLocator<ApologyRepository>()));

  serviceLocator.registerFactory<GetSentApologiesUsecase>(
      () => GetSentApologiesUsecase(serviceLocator<ApologyRepository>()));
  serviceLocator.registerFactory<GetRecievedApologiesUsecase>(
      () => GetRecievedApologiesUsecase(serviceLocator<ApologyRepository>()));

  serviceLocator.registerFactory<SendApologyUsecase>(
      () => SendApologyUsecase(serviceLocator<ApologyRepository>()));
  serviceLocator.registerFactory<DeleteApologyUsecase>(
      () => DeleteApologyUsecase(serviceLocator<ApologyRepository>()));
  serviceLocator.registerFactory<UpdateApologyUsecase>(
      () => UpdateApologyUsecase(serviceLocator<ApologyRepository>()));

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

  serviceLocator.registerLazySingleton<ApologyBloc>(
    () => ApologyBloc(
      deleteApologyUsecase: serviceLocator<DeleteApologyUsecase>(),
      getRecievedApologiesUsecase:
          serviceLocator<GetRecievedApologiesUsecase>(),
      getSentApologiesUsecase: serviceLocator<GetSentApologiesUsecase>(),
      sendApologyUsecase: serviceLocator<SendApologyUsecase>(),
      getApologyByIdUsecase: serviceLocator<GetApologyByIdUseCase>(),
      updateApologyUsecase: serviceLocator<UpdateApologyUsecase>(),
    ),
  );
}
