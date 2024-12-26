import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';
import 'package:friends_forever_flutter/features/apologies/domain/repositories/apology_repository.dart';

class UpdateApologyUsecase implements Usecase<void, ApologyModel> {
  ApologyRepository apologyRepository;

  UpdateApologyUsecase(this.apologyRepository);

  @override
  Future<Either<Failure, void>> call(ApologyModel params) async {
    return await apologyRepository.updateApology(params);
  }
}
