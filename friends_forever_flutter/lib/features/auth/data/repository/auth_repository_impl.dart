import 'package:fpdart/src/either.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/features/auth/data/datasources/auth_datasource.dart';
import 'package:friends_forever_flutter/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await dataSource.currentUser();
      if (user == null) return left(Failure("User not found"));
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> emailVerification(
      {required String email, required String code}) async {
    try {
      final user = await dataSource.emailVerification(email: email, code: code);
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final user = await dataSource.loginWithEmailPassword(
          email: email, password: password);
      if (user == null) return left(Failure("User not found"));
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final loggedOut = await dataSource.logout();
      return right(loggedOut);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithEmailPassword(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final user = await dataSource.registerWithEmailPassword(
          username: username, email: email, password: password);
      if (user == null || !user) return left(Failure("User not created"));
      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
