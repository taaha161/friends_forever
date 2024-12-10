/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'user.dart' as _i2;

abstract class Letters implements _i1.SerializableModel {
  Letters._({
    this.id,
    required this.senderId,
    this.sender,
    required this.recieverId,
    this.reciever,
    required this.message,
    required this.subject,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Letters({
    int? id,
    required int senderId,
    _i2.User? sender,
    required int recieverId,
    _i2.User? reciever,
    required String message,
    required String subject,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LettersImpl;

  factory Letters.fromJson(Map<String, dynamic> jsonSerialization) {
    return Letters(
      id: jsonSerialization['id'] as int?,
      senderId: jsonSerialization['senderId'] as int,
      sender: jsonSerialization['sender'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['sender'] as Map<String, dynamic>)),
      recieverId: jsonSerialization['recieverId'] as int,
      reciever: jsonSerialization['reciever'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['reciever'] as Map<String, dynamic>)),
      message: jsonSerialization['message'] as String,
      subject: jsonSerialization['subject'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int senderId;

  _i2.User? sender;

  int recieverId;

  _i2.User? reciever;

  String message;

  String subject;

  DateTime createdAt;

  DateTime updatedAt;

  Letters copyWith({
    int? id,
    int? senderId,
    _i2.User? sender,
    int? recieverId,
    _i2.User? reciever,
    String? message,
    String? subject,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJson(),
      'recieverId': recieverId,
      if (reciever != null) 'reciever': reciever?.toJson(),
      'message': message,
      'subject': subject,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LettersImpl extends Letters {
  _LettersImpl({
    int? id,
    required int senderId,
    _i2.User? sender,
    required int recieverId,
    _i2.User? reciever,
    required String message,
    required String subject,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          senderId: senderId,
          sender: sender,
          recieverId: recieverId,
          reciever: reciever,
          message: message,
          subject: subject,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Letters copyWith({
    Object? id = _Undefined,
    int? senderId,
    Object? sender = _Undefined,
    int? recieverId,
    Object? reciever = _Undefined,
    String? message,
    String? subject,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Letters(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      sender: sender is _i2.User? ? sender : this.sender?.copyWith(),
      recieverId: recieverId ?? this.recieverId,
      reciever: reciever is _i2.User? ? reciever : this.reciever?.copyWith(),
      message: message ?? this.message,
      subject: subject ?? this.subject,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}