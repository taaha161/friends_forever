import 'package:fpdart/src/either.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase implements Usecase<User, LoginUserParams> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(LoginUserParams params) async {
    final user = await authRepository.loginWithEmailPassword(
        email: params.email, password: params.password);
    return user;
  }
}

class LoginUserParams {
  final String email;
  final String password;
  LoginUserParams(this.email, this.password);
}
