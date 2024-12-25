import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';
import 'package:friends_forever_flutter/features/user/domain/repository/user_repository.dart';

class GetUserByIdUsecase implements Usecase<UserModel, GetUserIdParams> {
  final UserRepository userRepository;
  GetUserByIdUsecase(this.userRepository);
  @override
  Future<Either<Failure, UserModel>> call(GetUserIdParams params) async {
    final user = await userRepository.getUserById(params.userId);
    return user.fold((l) => left(l), (r) => right(r));
  }
}

class GetUserIdParams {
  int userId;
  GetUserIdParams(this.userId);
}
