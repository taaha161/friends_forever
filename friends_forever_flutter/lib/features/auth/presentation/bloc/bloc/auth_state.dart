part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccessState extends AuthState {
  final User user;

  AuthSuccessState(this.user);
}

final class AuthFailedState extends AuthState {
  final String errorMessage;
  AuthFailedState(this.errorMessage);
}

final class AuthNeedsVerificationState extends AuthState {
  final String email;
  final String password;
  AuthNeedsVerificationState({required this.email, required this.password});
}

final class AuthLoadingState extends AuthState {}
