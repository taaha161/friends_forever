import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/apology_repository.dart';

final class DeleteApologyUsecase implements Usecase<void, int> {
  final ApologyRepository repository;

  DeleteApologyUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    return await repository.removeApology(id);
  }
}
