import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/friends/data/model/friend_model.dart';

import '../repository/friend_repository.dart';

class AddFriendUsecase implements Usecase<FriendModel, String> {
  final FriendRepository repository;
  AddFriendUsecase(this.repository);
  @override
  Future<Either<Failure, FriendModel>> call(String inviteCode) async {
    try {
      final newFriend = await repository.addFriend(inviteCode);
      return newFriend.fold((l) => left(l), (r) => right(r));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
