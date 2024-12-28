import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/friends/domain/repository/friend_repository.dart';

class RemoveFriendUsecase implements Usecase<void, String> {
  final FriendRepository repository;
  RemoveFriendUsecase(this.repository);
  @override
  Future<Either<Failure, void>> call(String inviteCode) async {
    try {
      await repository.removeFriend(inviteCode);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
