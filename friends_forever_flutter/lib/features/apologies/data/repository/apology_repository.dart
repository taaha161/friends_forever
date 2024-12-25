import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';
import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/entities/user.dart' as core;
import 'package:friends_forever_flutter/core/errors/exceptions.dart';
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
      if (apology.reciever == null) {
        throw ServerpodException("Reciever is null");
      }
      if (apology.sender == null) {
        throw ServerpodException("Sender is null");
      }

      return right(ApologyModel(
        id: apology.id!,
        message: apology.message,
        reciever: UserModel.fromUser(apology.reciever!),
        sender: UserModel.fromUser(apology.sender!),
        subject: apology.subject,
      ));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeApology(int id) async {
    try {
      await dataSource.deleteApology(id);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateApology(ApologyModel apology) async {
    try {
      dataSource.updateApology(apology);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ApologyModel>>> getRecievedApologies() async {
    try {
      final recievedApologies = await dataSource.recievedApologies();

      return right(recievedApologies.map((apology) {
        if (apology.reciever == null) {
          throw ServerpodException("Reciever is null");
        }
        if (apology.sender == null) {
          throw ServerpodException("Sender is null");
        }

        return ApologyModel(
          id: apology.id!,
          message: apology.message,
          reciever: UserModel.fromUser(apology.reciever!),
          sender: UserModel.fromUser(apology.sender!),
          subject: apology.subject,
        );
      }).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ApologyModel>>> getSentApologies() async {
    try {
      final sentApologies = await dataSource.recievedApologies();

      return right(sentApologies.map((apology) {
        if (apology.reciever == null) {
          throw ServerpodException("Reciever is null");
        }
        if (apology.sender == null) {
          throw ServerpodException("Sender is null");
        }

        return ApologyModel(
          id: apology.id!,
          message: apology.message,
          reciever: UserModel.fromUser(apology.reciever!),
          sender: UserModel.fromUser(apology.sender!),
          subject: apology.subject,
        );
      }).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
