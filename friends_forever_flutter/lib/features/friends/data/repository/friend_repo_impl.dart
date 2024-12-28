import 'package:fpdart/src/either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/features/friends/data/datasources/friend_data_source.dart';
import 'package:friends_forever_flutter/features/friends/data/model/friend_model.dart';
import 'package:friends_forever_flutter/features/friends/domain/repository/friend_repository.dart';

class FriendRepoImpl implements FriendRepository {
  final FriendDataSource dataSource;

  FriendRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, FriendModel>> addFriend(String inviteCode) async {
    try {
      final newFriend = await dataSource.addFriend(inviteCode);
      return right(newFriend);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FriendModel>>> getFriends() async {
    try {
      final friends = await dataSource.getFriends();
      return right(friends);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFriend(String inviteCode) async {
    try {
      await dataSource.removeFriend(inviteCode);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
