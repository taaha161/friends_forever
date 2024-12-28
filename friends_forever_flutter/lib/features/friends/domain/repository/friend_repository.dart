import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/features/friends/data/model/friend_model.dart';

import '../../../../core/errors/failure.dart';

abstract interface class FriendRepository {
  Future<Either<Failure, List<FriendModel>>> getFriends();
  Future<Either<Failure, FriendModel>> addFriend(String inviteCode);
  Future<Either<Failure, void>> removeFriend(String inviteCode);
}
