import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/core/entities/user.dart' as core;
import 'package:friends_forever_flutter/features/auth/data/models/user_model.dart';

class ApologyModel {
  int id;
  core.User sender;
  core.User reciever;
  String message;
  String subject;
  ApologyStatus? status = ApologyStatus.pending;
  DateTime? createdAt = DateTime.now();
  DateTime? updatedAt = DateTime.now();

  ApologyModel(
      {required this.id,
      required this.sender,
      required this.reciever,
      required this.message,
      required this.subject,
      this.status,
      this.createdAt,
      this.updatedAt});
}
