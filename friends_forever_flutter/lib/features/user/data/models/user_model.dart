import 'package:friends_forever_flutter/core/entities/user.dart' as core;

import 'package:friends_forever_client/friends_forever_client.dart';

class UserModel extends core.User {
  UserModel({
    required id,
    required email,
    required username,
    required inviteCode,
  }) : super(id: id, email: email, username: username, inviteCode: inviteCode);

  UserModel.fromUser(User userInfo)
      : super(
            id: userInfo.id!,
            email: userInfo.userInfo!.email!,
            username: userInfo.userInfo!.userName!,
            inviteCode: userInfo.inviteCode!.code!);
}
