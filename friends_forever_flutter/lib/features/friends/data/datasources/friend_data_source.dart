import 'dart:developer';

import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/entities/user.dart' as core;
import 'package:friends_forever_flutter/features/friends/data/model/friend_model.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import '../../../../core/errors/exceptions.dart';

abstract interface class FriendDataSource {
  Future<List<FriendModel>> getFriends();
  Future<FriendModel> addFriend(String inviteCode);
  Future<void> removeFriend(String inviteCode);
}

final class FriendDataSourceImpl implements FriendDataSource {
  final Client client;
  final SessionManager sessionManager;

  FriendDataSourceImpl({required this.client, required this.sessionManager});

  @override
  Future<List<FriendModel>> getFriends() async {
    try {
      final List<Friends>? friends = await client.friends.get(page: 1);
      if (friends != null) {
        return friends.map((e) {
          if (e.friend == null) {
            throw ServerpodException("No friends found");
          }
          log(e.friend.toString());

          return FriendModel.fromUser(e.friend!);
        }).toList();
      }

      throw ServerpodException("No friends found");
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<FriendModel> addFriend(String inviteCode) async {
    try {
      User? friend = await client.friends.addFriend(inviteCode);
      if (friend != null) {
        return FriendModel.fromUser(friend);
      }
      throw ServerpodException("Code doesnt exist or already used");
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<void> removeFriend(String inviteCode) async {
    try {
      await client.friends.removeFriend(inviteCode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
