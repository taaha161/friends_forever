part of 'user_cubit.dart';

@immutable
sealed class UserState extends Equatable {}

final class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

final class UserLoggedIn extends UserState {
  final User user;
  UserLoggedIn(this.user);

  @override
  List<Object?> get props => [user];
}
