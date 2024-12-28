import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:friends_forever_flutter/features/friends/data/model/friend_model.dart';
import 'package:friends_forever_flutter/features/friends/domain/usecases/add_friend_usecase.dart';
import 'package:friends_forever_flutter/features/friends/domain/usecases/get_friends_usecase.dart';
import 'package:friends_forever_flutter/features/friends/domain/usecases/remove_friend_usecase.dart';
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';

part 'friends_event.dart';
part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  final GetFriendsUsecase getFriendsUsecase;
  final AddFriendUsecase addFriendUsecase;
  final RemoveFriendUsecase removeFriendUsecase;
  FriendsBloc({
    required this.getFriendsUsecase,
    required this.addFriendUsecase,
    required this.removeFriendUsecase,
  }) : super(FriendsInitial()) {
    on<LoadFriendsEvent>((event, emit) {
      return _loadFriends(event, emit);
    });
    on<FriendAddedEvent>((event, emit) {
      return _addFriends(event, emit);
    });
    on<FriendRemovedEvent>((event, emit) {
      return _removeFriend(event, emit);
    });
  }

  _loadFriends(event, emit) async {
    emit(FriendsLoading());
    final friends = await getFriendsUsecase(NoParam());

    friends.fold((l) {
      emit(FriendsError(l.message));
    }, (r) {
      emit(FriendsLoaded(r));
    });
  }

  _addFriends(FriendAddedEvent event, emit) async {
    FriendsLoaded? currState;
    if (state is FriendsLoaded) {
      currState = state as FriendsLoaded;
    }
    emit(FriendsLoading());
    final friends = await addFriendUsecase(event.friendCode);

    friends.fold((l) {
      emit(FriendsError(l.message));
    }, (r) {
      if (currState != null) {
        final currFriends = currState.friends;
        currFriends.add(r);
        currState.copyWith(currFriends);
        emit(currState);
        return;
      } else {
        emit(FriendsLoaded([r]));
        return;
      }
    });
  }

  _removeFriend(FriendRemovedEvent event, emit) async {
    FriendsLoaded? currState;
    if (state is FriendsLoaded) {
      currState = state as FriendsLoaded;
    }
    emit(FriendsLoading());
    final friends = await removeFriendUsecase(event.friend.inviteCode);

    friends.fold((l) {
      emit(FriendsError(l.message));
    }, (r) {
      if (currState != null) {
        var currFriends = currState.friends;
        currFriends.removeWhere((element) => element.id == event.friend.id);
        log(currFriends.toString());
        currState.copyWith(currFriends);
        emit(currState);
        return;
      } else {
        emit(FriendsLoaded([]));
        return;
      }
    });
  }
}
