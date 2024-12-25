import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';

abstract interface class ApologyRepository {
  Future<Either<Failure, List<ApologyModel>>> getSentApologies();
  Future<Either<Failure, List<ApologyModel>>> getRecievedApologies();
  Future<Either<Failure, void>> send(ApologyModel apology);
  Future<Either<Failure, void>> removeApology(int id);
  Future<Either<Failure, ApologyModel>> getApologyById(int id);
  Future<Either<Failure, void>> updateApology(ApologyModel apology);
}
