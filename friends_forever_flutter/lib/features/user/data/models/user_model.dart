import 'package:friends_forever_flutter/core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required id,
    required email,
    required username,
    required inviteCode,
  }) : super(id: id, email: email, username: username, inviteCode: inviteCode);
}
