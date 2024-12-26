import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/core/usecase/usecase.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';
import 'package:friends_forever_flutter/features/apologies/domain/repositories/apology_repository.dart';

final class GetSentApologiesUsecase
    implements Usecase<List<ApologyModel>, NoParam> {
  final ApologyRepository repository;

  GetSentApologiesUsecase(this.repository);

  @override
  Future<Either<Failure, List<ApologyModel>>> call(NoParam params) async {
    return await repository.getSentApologies();
  }
}
