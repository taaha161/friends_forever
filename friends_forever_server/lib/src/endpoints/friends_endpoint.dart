import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:friends_forever_server/src/generated/user.dart';
import 'package:friends_forever_server/src/utils/utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class FriendsEndpoint extends Endpoint {
  // Override to enforce login requirement
  @override
  bool get requireLogin => true;

  /// Fetches the authenticated user and their details, including friends, invite codes, etc.
  /// [page] is used for pagination.

  /// Adds a friend based on the provided [inviteCode].
  /// Returns a success or error message in a map.
  Future<Map<String, String>> addFriend(
      Session session, String inviteCode) async {
    final authenticatedUserId = await getAuthenticatedUserId(session);
    if (authenticatedUserId == null) {
      return {"message": "Please log in first"};
    }

    final friendsPair =
        await _getFriendsPair(session, inviteCode, authenticatedUserId);
    if (friendsPair == null) {
      return {"message": "Invalid invite code"};
    }

    final checkFriendship =
        await _checkExistingFriendship(session, friendsPair[0], friendsPair[1]);
    if (checkFriendship) {
      return {"message": "You have already added this user "};
    }

    try {
      await _addFriendship(session, friendsPair[0], friendsPair[1]);
      return {"message": "Friends added"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<Map<String, String>> removeFriend(
      Session session, String inviteCode) async {
    final authenticatedUserId = await getAuthenticatedUserId(session);
    if (authenticatedUserId == null) {
      return {"message": "Please log in first"};
    }
    final friendsPair =
        await _getFriendsPair(session, inviteCode, authenticatedUserId);
    if (friendsPair == null) {
      return {"message": "Invalid invite code"};
    }
    final checkFriendship =
        await _checkExistingFriendship(session, friendsPair[0], friendsPair[1]);
    if (!checkFriendship) {
      return {"message": "You have already removed this user "};
    }
    try {
      await _removeFriendship(session, friendsPair[0], friendsPair[1]);
      return {"message": "Friend removed"};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  Future<List<Friends>?> get(Session session, {int page = 1}) async {
    final authenticatedUserId = await getAuthenticatedUserId(session);
    if (authenticatedUserId == null) return null;
    final user = await getUser(session, authenticatedUserId);
    if (user == null) return null;
    final friends = Friends.db.find(session,
        where: (p0) => p0.userId.equals(user.id),
        offset: (page - 1) * 10,
        limit: 10,
        include: Friends.include(
            friend: User.include(
                userInfo: UserInfo.include(),
                inviteCode: InviteCode.include())));
    return friends;
  }
}

/// Retrieves a pair of [User] objects (current user and friend) based on the [inviteCode].
Future<List<User>?> _getFriendsPair(
    Session session, String inviteCode, int authenticatedUserId) async {
  final friend = await User.db.findFirstRow(
    session,
    where: (row) => row.inviteCode.code.equals(inviteCode),
  );
  if (friend == null) return null;

  final currentUser = await User.db.findFirstRow(
    session,
    where: (row) => row.userInfoId.equals(authenticatedUserId),
  );
  return currentUser != null ? [friend, currentUser] : null;
}

Future<bool> _checkExistingFriendship(
    Session session, User user, User friend) async {
  final friendship = await Friends.db.findFirstRow(
    session,
    where: (p0) => (p0.userId.equals(user.id) & p0.friendId.equals(friend.id)),
  );
  return friendship == null ? false : true;
}

/// Adds a bidirectional friendship relationship between two users.
Future<void> _addFriendship(Session session, User user1, User user2) async {
  final timestamp = DateTime.now();

  final friendships = [
    Friends(
      userId: user1.id!,
      friendId: user2.id!,
      createdAt: timestamp,
      updatedAt: timestamp,
    ),
    Friends(
      userId: user2.id!,
      friendId: user1.id!,
      createdAt: timestamp,
      updatedAt: timestamp,
    ),
  ];

  await Friends.db.insert(session, friendships);
}

/// removes a bidirectional friendship relationship between two users.
Future<void> _removeFriendship(Session session, User user1, User user2) async {
  await Friends.db.deleteWhere(
    session,
    where: (p0) =>
        ((p0.friendId.equals(user1.id) & p0.userId.equals(user2.id)) |
            (p0.friendId.equals(user2.id) & p0.userId.equals(user1.id))),
  );
}
