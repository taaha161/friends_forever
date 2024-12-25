import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/errors/exceptions.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';
import 'package:friends_forever_flutter/features/user/domain/usecases/get_user_by_id_usecase.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract interface class ApologyDataSource {
  Future<List<Apologies>> sentApologies();
  Future<List<Apologies>> recievedApologies();
  Future<void> deleteApology(int id);
  Future<void> sendApology(
      {required int recipientId,
      required String message,
      required String subject});
  Future<Apologies> getApologyById(int id);
  Future<void> updateApology(ApologyModel apology);
}

class ApologyDataSourceImpl implements ApologyDataSource {
  final SessionManager sessionManager;
  final Client client;
  final GetUserByIdUsecase getUserByIdUsecase;

  ApologyDataSourceImpl({
    required this.sessionManager,
    required this.client,
    required this.getUserByIdUsecase,
  });

  @override
  Future<void> deleteApology(int id) async {
    try {
      await client.apology.delete(id);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<Apologies> getApologyById(int id) async {
    try {
      final apology = await client.apology.read(id);
      if (apology == null) {
        throw ServerpodException("Apology not found");
      }

      return apology;
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<List<Apologies>> recievedApologies() async {
    try {
      final apologies = await client.apology.recieved();
      return apologies;
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<void> sendApology(
      {required int recipientId,
      required String message,
      required String subject}) async {
    try {
      await client.apology.create(recipientId, message, subject);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<List<Apologies>> sentApologies() async {
    try {
      final apologies = await client.apology.sent();
      return apologies;
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }

  @override
  Future<void> updateApology(ApologyModel apology) {
    try {
      return client.apology.update(apology.id,
          message: apology.message,
          subject: apology.subject,
          status: apology.status);
    } catch (e) {
      throw ServerpodException(e.toString());
    }
  }
}
