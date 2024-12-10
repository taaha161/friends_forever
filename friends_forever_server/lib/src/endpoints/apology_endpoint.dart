import 'dart:developer';

import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:friends_forever_server/src/utils/utils.dart';
import 'package:serverpod/serverpod.dart';

class ApologyEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Map<String, String>> create(
      Session session, int recipientId, String message, String subject) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return {"message": "Please log in"};

    final user = await getUser(session, authenticatedId);
    final timestamp = DateTime.now();

    try {
      await Apologies.db.insertRow(
          session,
          Apologies(
              senderId: user!.id!,
              recieverId: recipientId,
              message: message,
              subject: subject,
              status: ApologyStatus.pending,
              createdAt: timestamp,
              updatedAt: timestamp));
      return {"message": "Apology sent"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<Apologies?> read(
    Session session,
    int id,
  ) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return null;

    try {
      return await Apologies.db.findById(session, id);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, String>> update(Session session, int id,
      {String? message, String? subject, ApologyStatus? status}) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return {"message": "Please log in"};

    final apology = await read(session, id);
    if (apology == null) return {"message": "Apology not found"};
    if (message != null) {
      apology.message = message;
    }
    if (subject != null) {
      apology.subject = subject;
    }
    if (status != null) {
      apology.status = status;
    }

    try {
      await Apologies.db.updateRow(session, apology);
      return {"message": "Apology updated"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<Map<String, String>> delete(
    Session session,
    int id,
  ) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return {"message": "Please log in"};

    final apology = await read(session, id);
    if (apology == null) return {"message": "Apology not found"};

    try {
      await Apologies.db.deleteRow(session, apology);
      return {"message": "Apology deleted"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<List<Apologies>> recieved(Session session) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return [];

    final user = await getUser(session, authenticatedId);

    try {
      final apologies = Apologies.db.find(
        session,
        where: (p0) => p0.recieverId.equals(user!.id),
      );
      return apologies;
    } catch (e) {
      return [];
    }
  }

  Future<List<Apologies>> sent(Session session) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return [];

    final user = await getUser(session, authenticatedId);

    try {
      final apologies = Apologies.db.find(
        session,
        where: (p0) => p0.senderId.equals(user!.id),
      );
      return apologies;
    } catch (e) {
      return [];
    }
  }
}
