import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/repositories/apology_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/apology_model.dart';

class GetApologyByIdUseCase implements Usecase<ApologyModel, int> {
  ApologyRepository apologyRepository;
  GetApologyByIdUseCase(this.apologyRepository);
  @override
  Future<Either<Failure, ApologyModel>> call(int id) async {
    return await apologyRepository.getApologyById(id);
  }
}
