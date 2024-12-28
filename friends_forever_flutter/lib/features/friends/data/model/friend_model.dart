import 'package:friends_forever_flutter/core/entities/user.dart';
import 'package:friends_forever_client/friends_forever_client.dart' as client;

class FriendModel extends User {
  FriendModel(
      {required email, required username, required inviteCode, required id})
      : super(email: email, username: username, inviteCode: inviteCode, id: id);

  FriendModel.fromUser(client.User userInfo)
      : super(
            id: userInfo.id!,
            email: userInfo.userInfo!.email!,
            username: userInfo.userInfo!.userName!,
            inviteCode: userInfo.inviteCode!.code);
}
