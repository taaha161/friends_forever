import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:friends_forever_server/src/utils/utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  // Override to enforce login requirement
  @override
  bool get requireLogin => true;

  /// Fetches the authenticated user and their details, including friends, invite codes, etc.
  /// [page] is used for pagination.
  Future<User?> get(Session session) async {
    final authenticatedUserId = await getAuthenticatedUserId(session);
    if (authenticatedUserId == null) return null;

    return await User.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authenticatedUserId),
      include: User.include(
        userInfo: UserInfo.include(),
        inviteCode: InviteCode.include(),
      ),
    );
  }

  Future<User?> getUserById(Session session, int id) async {
    return await User.db.findFirstRow(
      session,
      where: (row) => row.id.equals(id),
      include: User.include(
        userInfo: UserInfo.include(),
        inviteCode: InviteCode.include(),
      ),
    );
  }

  Future<User?> verifyEmail(Session session, UserInfo userInfo) async {
    final user = await User.db.findFirstRow(
      session,
      where: (p0) => p0.userInfoId.equals(userInfo.id),
    );

    return user;
  }
}
