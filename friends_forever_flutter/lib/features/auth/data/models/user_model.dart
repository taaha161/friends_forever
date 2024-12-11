import '../../../../core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.inviteCode,
  });
}
