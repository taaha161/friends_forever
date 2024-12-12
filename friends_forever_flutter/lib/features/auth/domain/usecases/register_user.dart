import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/error.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/auth/domain/repository/auth_repository.dart';

class RegisterUserUseCase implements Usecase<bool, RegisterUserParams> {
  final AuthRepository authRepository;

  RegisterUserUseCase(this.authRepository);
  @override
  Future<Either<Failure, bool>> call(RegisterUserParams params) async {
    final registered = await authRepository.registerWithEmailPassword(
        email: params.email,
        password: params.password,
        username: params.username);
    return registered;
  }
}

class RegisterUserParams {
  final String email;
  final String password;
  final String username;
  RegisterUserParams(this.email, this.password, this.username);
}
