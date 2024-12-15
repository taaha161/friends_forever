import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> currentUser();
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password});

  Future<Either<Failure, bool>> registerWithEmailPassword(
      {required String username,
      required String email,
      required String password});

  Future<Either<Failure, User>> emailVerification(
      {required String email, required String code});

  Future<Either<Failure, void>> logout();
}
