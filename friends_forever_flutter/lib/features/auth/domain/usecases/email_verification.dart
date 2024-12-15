import 'package:fpdart/src/either.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/auth/domain/repository/auth_repository.dart';

class EmailVerificationUseCase
    implements Usecase<User, EmailVerificationParams> {
  final AuthRepository authRepository;

  EmailVerificationUseCase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(EmailVerificationParams params) async {
    final user = await authRepository.emailVerification(
        email: params.email, code: params.code);
    return user.fold((l) => left(l), (r) async {
      final userLoggedIn = authRepository.loginWithEmailPassword(
          email: params.email, password: params.password);
      return userLoggedIn;
    });
  }
}

class EmailVerificationParams {
  final String email;
  final String code;
  final String password;
  EmailVerificationParams(
      {required this.email, required this.code, required this.password});
}
