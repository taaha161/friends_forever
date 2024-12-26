import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';
import 'package:friends_forever_flutter/features/apologies/domain/repositories/apology_repository.dart';

import '../../../../core/errors/failure.dart';

final class GetRecievedApologiesUsecase
    implements Usecase<List<ApologyModel>, NoParam> {
  final ApologyRepository repository;

  GetRecievedApologiesUsecase(this.repository);

  @override
  Future<Either<Failure, List<ApologyModel>>> call(NoParam params) async {
    return await repository.getRecievedApologies();
  }
}
