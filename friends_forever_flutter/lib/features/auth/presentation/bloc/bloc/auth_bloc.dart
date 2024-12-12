import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/current_user.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/email_verification.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/login.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/logout.dart';
import 'package:friends_forever_flutter/features/auth/domain/usecases/register_user.dart';
import 'package:friends_forever_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserCubit userCubit;
  final LoginUseCase loginUseCase;
  final CurrentUserUseCase currentUserUseCase;
  final EmailVerificationUseCase emailVerificationUseCase;
  final LogoutUseCase logoutUseCase;
  final RegisterUserUseCase registerUserUseCase;

  AuthBloc({
    required this.userCubit,
    required this.loginUseCase,
    required this.currentUserUseCase,
    required this.emailVerificationUseCase,
    required this.registerUserUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(AuthLoadingState());
    });
    on<AuthLoginEvent>((event, emit) {
      return _loginEvent(event, emit);
    });
    on<AuthLogoutEvent>((event, emit) {
      return _logoutEvent(event, emit);
    });
    on<AuthCheckUserEvent>((event, emit) {
      return _checkUserLoggedIn(event, emit);
    });
    on<AuthRegisterEvent>((event, emit) {
      return _createUserEvent(event, emit);
    });
    on<AuthVerifyEvent>((event, emit) {
      return _verifyEmailEvent(event, emit);
    });
  }

  FutureOr<void> _loginEvent(AuthLoginEvent event, Emitter emit) async {
    final user =
        await loginUseCase.call(LoginUserParams(event.email, event.password));
    user.fold((fail) => emit(AuthFailedState(fail.message)), (success) {
      _authLoginSuccess(success, emit);
    });
  }

  FutureOr<void> _logoutEvent(AuthLogoutEvent event, Emitter emit) async {
    final user = await logoutUseCase.call(NoParam());
    user.fold((fail) => emit(AuthFailedState(fail.message)), (success) {});
  }

  FutureOr<void> _createUserEvent(AuthRegisterEvent event, Emitter emit) async {
    final user = await registerUserUseCase
        .call(RegisterUserParams(event.email, event.password, event.username));
    user.fold((fail) => emit(AuthFailedState(fail.message)), (success) {
      emit(AuthNeedsVerificationState(
          email: event.email, password: event.password));
    });
  }

  FutureOr<void> _verifyEmailEvent(AuthVerifyEvent event, Emitter emit) async {
    final user = await emailVerificationUseCase.call(EmailVerificationParams(
        email: event.email, code: event.code, password: event.password));
    user.fold((fail) => emit(AuthFailedState(fail.message)), (success) {
      emit(AuthLoginEvent(email: event.email, password: event.password));
    });
  }

  FutureOr<void> _checkUserLoggedIn(
      AuthCheckUserEvent event, Emitter emit) async {
    final user = await currentUserUseCase.call(NoParam());
    user.fold((fail) => emit(AuthFailedState(fail.message)), (success) {
      _authLoginSuccess(success, emit);
    });
  }

  _authLogoutSuccess(User user, Emitter emit) {
    userCubit.logout();
    emit(AuthInitial());
  }

  _authLoginSuccess(User user, Emitter emit) {
    userCubit.updateUser(user);
    emit(AuthSuccessState(user));
  }
}
