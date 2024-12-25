import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_flutter/core/errors/exceptions.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract interface class UserDataSource {
  Future<List<UserModel>> getFriends();
  Future<void> addFriend(int id);
  Future<void> removeFriend(int id);
  Future<UserModel> getUserById(int id);
  Future<void> updateUser(UserModel user);
}

class UserDataSourceImpl implements UserDataSource {
  final SessionManager sessionManager;
  final Client client;

  UserDataSourceImpl({required this.sessionManager, required this.client});

  @override
  Future<List<UserModel>> getFriends() async {
    // TO DO: implement getFriends
    throw UnimplementedError();
  }

  @override
  Future<void> addFriend(int id) {
    // TODO: implement addFriend
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getUserById(int id) async {
    try {
      final user = await client.user.getUserById(id);
      if (user == null ||
          user.id == null ||
          user.userInfo == null ||
          user.inviteCode == null ||
          user.userInfo!.email == null ||
          user.userInfo!.userName == null) {
        throw ServerpodException("User not found");
      }

      return UserModel(
          id: user.id!,
          email: user.userInfo!.email!,
          username: user.userInfo!.userName!,
          inviteCode: user.inviteCode!.code);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<void> removeFriend(int id) {
    // TODO: implement removeFriend
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserModel user) async {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
