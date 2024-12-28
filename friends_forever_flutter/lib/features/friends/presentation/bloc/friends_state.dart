part of 'friends_bloc.dart';

@immutable
sealed class FriendsState {}

final class FriendsInitial extends FriendsState {}

final class FriendsLoading extends FriendsState {}

final class FriendsLoaded extends FriendsState {
  final List<FriendModel> friends;

  FriendsLoaded(this.friends);

  FriendsLoaded copyWith(List<FriendModel>? friends) {
    return FriendsLoaded(friends ?? this.friends);
  }
}

final class FriendsError extends FriendsState {
  final String message;

  FriendsError(this.message);
}
