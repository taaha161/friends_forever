import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/friends/data/model/friend_model.dart';
import 'package:friends_forever_flutter/features/friends/domain/repository/friend_repository.dart';

class GetFriendsUsecase implements Usecase<List<FriendModel>, NoParam> {
  final FriendRepository repository;
  GetFriendsUsecase(this.repository);
  @override
  Future<Either<Failure, List<FriendModel>>> call(NoParam params) async {
    try {
      final friends = await repository.getFriends();
      return friends.fold((l) => left(l), (r) => right(r));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
