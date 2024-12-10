import 'dart:developer';

import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:friends_forever_server/src/utils/utils.dart';
import 'package:serverpod/serverpod.dart';

class LetterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Map<String, String>> create(
      Session session, int recipientId, String message, String subject) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return {"message": "Please log in"};

    final user = await getUser(session, authenticatedId);
    final timestamp = DateTime.now();

    try {
      await Letters.db.insertRow(
          session,
          Letters(
              senderId: user!.id!,
              recieverId: recipientId,
              message: message,
              subject: subject,
              createdAt: timestamp,
              updatedAt: timestamp));
      return {"message": "Letter sent"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<Letters?> read(
    Session session,
    int id,
  ) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return null;

    try {
      return await Letters.db.findById(session, id);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, String>> update(Session session, int id,
      {String? message, String? subject}) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return {"message": "Please log in"};

    final letter = await read(session, id);
    if (letter == null) return {"message": "Letter not found"};
    if (message != null) {
      letter.message = message;
    }
    if (subject != null) {
      letter.subject = subject;
    }

    try {
      await Letters.db.updateRow(session, letter);
      return {"message": "Letter updated"};
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

    final letter = await read(session, id);
    if (letter == null) return {"message": "Letter not found"};

    try {
      await Letters.db.deleteRow(session, letter);
      return {"message": "Letter deleted"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<List<Letters>> recieved(Session session) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return [];

    final user = await getUser(session, authenticatedId);

    try {
      final letters = Letters.db.find(
        session,
        where: (p0) => p0.recieverId.equals(user!.id),
      );
      return letters;
    } catch (e) {
      return [];
    }
  }

  Future<List<Letters>> sent(Session session) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return [];

    final user = await getUser(session, authenticatedId);

    try {
      final letters = Letters.db.find(
        session,
        where: (p0) => p0.senderId.equals(user!.id),
      );
      return letters;
    } catch (e) {
      return [];
    }
  }
}
