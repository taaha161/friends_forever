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
  Future<User?> get(Session session, {int page = 1}) async {
    final authenticatedUserId = await getAuthenticatedUserId(session);
    if (authenticatedUserId == null) return null;

    return await User.db.findFirstRow(
      session,
      where: (row) => row.userInfoId.equals(authenticatedUserId),
      include: User.include(
        userInfo: UserInfo.include(),
        friends: _friendsIncludeConfig(page),
        inviteCode: InviteCode.include(),
      ),
    );
  }
}

/// Configures the pagination and data to include for a user's friends.
FriendsIncludeList? _friendsIncludeConfig(int page) {
  return Friends.includeList(
    limit: 10,
    offset: (page - 1) * 10,
    include: Friends.include(
      user: User.include(userInfo: UserInfo.include()),
      friend: User.include(userInfo: UserInfo.include()),
    ),
  );
}
