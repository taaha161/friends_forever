import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<User?> get(Session session, {int page = 0}) async {
    final authenticatedInfo = await session.authenticated;

    if (authenticatedInfo != null) {
      final user = await User.db.findFirstRow(session,
          where: (row) => row.userInfoId.equals(authenticatedInfo.userId),
          include: User.include(
              userInfo: UserInfo.include(),
              friends: Friends.includeList(
                  limit: 10,
                  offset: (page - 1) * 10,
                  include: Friends.include(
                      user: User.include(userInfo: UserInfo.include()),
                      friend: User.include(userInfo: UserInfo.include()))),
              inviteCode: InviteCode.include()));
      return user;
    }
    return null;
  }
}
