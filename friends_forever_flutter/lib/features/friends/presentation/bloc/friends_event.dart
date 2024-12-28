part of 'friends_bloc.dart';

@immutable
sealed class FriendsEvent {}

final class LoadFriendsEvent extends FriendsEvent {}

final class FriendLoadedEvent extends FriendsEvent {
  final List<FriendModel> friends;

  FriendLoadedEvent(this.friends);
}

final class FriendAddedEvent extends FriendsEvent {
  final String friendCode;

  FriendAddedEvent(this.friendCode);
}

final class FriendRemovedEvent extends FriendsEvent {
  final FriendModel friend;

  FriendRemovedEvent(this.friend);
}
