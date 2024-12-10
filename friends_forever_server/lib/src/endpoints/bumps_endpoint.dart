import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:friends_forever_server/src/utils/utils.dart';
import 'package:serverpod/serverpod.dart';

class BumpsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Map<String, String>> create(Session session, int recipientId) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return {"message": "Please log in"};

    final user = await getUser(session, authenticatedId);
    final timestamp = DateTime.now();

    try {
      await Bumps.db.insertRow(
          session,
          Bumps(
              senderId: user!.id!,
              recieverId: recipientId,
              createdAt: timestamp,
              updatedAt: timestamp));
      return {"message": "User bumped"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<List<Bumps>> recieved(Session session) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return [];

    final user = await getUser(session, authenticatedId);

    try {
      final bumps = Bumps.db.find(
        session,
        where: (p0) => p0.recieverId.equals(user!.id),
      );
      return bumps;
    } catch (e) {
      return [];
    }
  }

  Future<List<Bumps>> sent(Session session) async {
    final authenticatedId = await getAuthenticatedUserId(session);
    if (authenticatedId == null) return [];

    final user = await getUser(session, authenticatedId);

    try {
      final bumps = Bumps.db.find(
        session,
        where: (p0) => p0.senderId.equals(user!.id),
      );
      return bumps;
    } catch (e) {
      return [];
    }
  }
}
