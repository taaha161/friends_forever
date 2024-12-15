import 'package:fpdart/src/either.dart';
import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/auth/domain/repository/auth_repository.dart';

class CurrentUserUseCase implements Usecase<User, NoParam> {
  final AuthRepository authRepository;
  CurrentUserUseCase(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParam params) async {
    final user = await authRepository.currentUser();
    return user.fold((failure) => left(failure), (user) => right(user));
  }
}
