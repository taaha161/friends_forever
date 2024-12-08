import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class UserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<InviteCode?> inviteCode(Session session) async {
    final authenticatedInfo = await session.authenticated;

    if (authenticatedInfo != null) {
      final inviteCode = InviteCode.db.findFirstRow(session,
          where: (p0) => p0.userInfoId.equals(authenticatedInfo.userId),
          include: InviteCode.include(userInfo: UserInfo.include()));
      return inviteCode;
    }
    return null;
  }
}
