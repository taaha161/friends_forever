import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';

abstract interface class UserRepository {
  Future<Either<Failure, UserModel>> getFriends();
  Future<Either<Failure, void>> addFriend(int id);
  Future<Either<Failure, void>> removeFriend(int id);
  Future<Either<Failure, UserModel>> getUserById(int id);
  Future<Either<Failure, void>> updateUser(UserModel user);
}
