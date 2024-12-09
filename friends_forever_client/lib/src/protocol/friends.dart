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

abstract class Friends implements _i1.SerializableModel {
  Friends._({
    this.id,
    required this.userId,
    this.user,
    required this.friendId,
    this.friend,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Friends({
    int? id,
    required int userId,
    _i2.User? user,
    required int friendId,
    _i2.User? friend,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _FriendsImpl;

  factory Friends.fromJson(Map<String, dynamic> jsonSerialization) {
    return Friends(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      friendId: jsonSerialization['friendId'] as int,
      friend: jsonSerialization['friend'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['friend'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.User? user;

  int friendId;

  _i2.User? friend;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? deletedAt;

  Friends copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? friendId,
    _i2.User? friend,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'friendId': friendId,
      if (friend != null) 'friend': friend?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FriendsImpl extends Friends {
  _FriendsImpl({
    int? id,
    required int userId,
    _i2.User? user,
    required int friendId,
    _i2.User? friend,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          friendId: friendId,
          friend: friend,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  @override
  Friends copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? friendId,
    Object? friend = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? deletedAt = _Undefined,
  }) {
    return Friends(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      friendId: friendId ?? this.friendId,
      friend: friend is _i2.User? ? friend : this.friend?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}
