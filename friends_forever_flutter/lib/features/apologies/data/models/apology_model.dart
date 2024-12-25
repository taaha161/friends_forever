import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';
import 'package:friends_forever_flutter/features/user/domain/usecases/get_user_by_id_usecase.dart';

class ApologyModel {
  int id;
  UserModel sender;
  UserModel reciever;
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
