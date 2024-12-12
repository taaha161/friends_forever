import 'package:fpdart/fpdart.dart';
import 'package:friends_forever_flutter/core/errors/error.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParam {}
