import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/error.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/auth/domain/repository/auth_repository.dart';

class LogoutUseCase implements Usecase<void, NoParam> {
  final AuthRepository authRepository;

  LogoutUseCase(this.authRepository);
  @override
  Future<Either<Failure, void>> call(NoParam params) async {
    final user = await authRepository.logout();
    return user;
  }
}
