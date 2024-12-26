import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/apologies/domain/repositories/apology_repository.dart';

import '../../data/models/apology_model.dart';

class SendApologyUsecase implements Usecase<void, ApologyModel> {
  ApologyRepository apologyRepository;
  SendApologyUsecase(this.apologyRepository);

  @override
  Future<Either<Failure, void>> call(ApologyModel params) async {
    return await apologyRepository.send(params);
  }
}
