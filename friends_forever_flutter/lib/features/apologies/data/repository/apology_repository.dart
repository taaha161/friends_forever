import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';
import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/entities/user.dart' as core;
import 'package:friends_forever_flutter/core/errors/failure.dart';
import 'package:friends_forever_flutter/features/apologies/data/data_sources/apology_data_source.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';
import 'package:friends_forever_flutter/features/apologies/domain/repositories/apology_repository.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';
import 'package:friends_forever_flutter/features/user/domain/usecases/get_user_by_id_usecase.dart';

class ApologyRepositoryImpl implements ApologyRepository {
  final ApologyDataSource dataSource;
  final GetUserByIdUsecase getUserByIdUsecase;
  ApologyRepositoryImpl(
      {required this.dataSource, required this.getUserByIdUsecase});

  @override
  Future<Either<Failure, void>> send(ApologyModel apology) async {
    try {
      dataSource.sendApology(
          message: apology.message,
          recipientId: apology.reciever.id,
          subject: apology.subject);

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApologyModel>> getApologyById(int id) async {
    try {
      final apology = await dataSource.getApologyById(id);
      if (apology.id == null) return left(Failure("Apology not found"));

      final senderAndReciever = await getSenderAndReciever(apology);

      return senderAndReciever.fold(
          (l) => left(Failure("Sender or reciever not found")),
          (r) => right(ApologyModel(
                id: apology.id!,
                message: apology.message,
                reciever: r[1],
                sender: r[0],
                subject: apology.subject,
              )));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeApology(int id) {
    // TODO: implement removeApology
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateApology(ApologyModel apology) {
    // TODO: implement updateApology
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ApologyModel>>> getRecievedApologies() {
    // TODO: implement getRecievedApologies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ApologyModel>>> getSentApologies() {
    // TODO: implement getSentApologies
    throw UnimplementedError();
  }

  Future<Either<Failure, List<core.User>>> getSenderAndReciever(
      Apologies apology) async {
    final recieverFromUseCase =
        await getUserByIdUsecase(GetUserIdParams(apology.recieverId));
    final senderFromUseCase =
        await getUserByIdUsecase(GetUserIdParams(apology.senderId));
    core.User? reciever;
    core.User? sender;

    recieverFromUseCase.fold((l) => left(Failure("Reciever not found")), (r) {
      reciever = r;
    });

    senderFromUseCase.fold((l) => left(Failure("Sender not found")), (r) {
      sender = r;
    });

    if (reciever == null || sender == null) {
      return left(Failure("Reciever or Sender not found"));
    }

    return right([sender!, reciever!]);
  }
}
