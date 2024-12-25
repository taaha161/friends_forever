import 'package:fpdart/src/either.dart';
import 'package:friends_forever_flutter/core/errors/exceptions.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';
import 'package:friends_forever_flutter/features/user/data/data_sources/user_data_sources.dart';
import 'package:friends_forever_flutter/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, void>> addFriend(int id) {
    // TODO: implement addFriend
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> getFriends() {
    // TODO: implement getFriends
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> getUserById(int id) async {
    try {
      final user = await dataSource.getUserById(id);
      return Right(user);
    } on ServerpodException catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFriend(int id) {
    // TODO: implement removeFriend
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUser(UserModel user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
