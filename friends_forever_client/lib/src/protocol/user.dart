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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'friends.dart' as _i3;
import 'invite_code.dart' as _i4;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    this.friends,
    required this.inviteCodeId,
    this.inviteCode,
  });

  factory User({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Friends>? friends,
    required int inviteCodeId,
    _i4.InviteCode? inviteCode,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      friends: (jsonSerialization['friends'] as List?)
          ?.map((e) => _i3.Friends.fromJson((e as Map<String, dynamic>)))
          .toList(),
      inviteCodeId: jsonSerialization['inviteCodeId'] as int,
      inviteCode: jsonSerialization['inviteCode'] == null
          ? null
          : _i4.InviteCode.fromJson(
              (jsonSerialization['inviteCode'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  List<_i3.Friends>? friends;

  int inviteCodeId;

  _i4.InviteCode? inviteCode;

  User copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Friends>? friends,
    int? inviteCodeId,
    _i4.InviteCode? inviteCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (friends != null)
        'friends': friends?.toJson(valueToJson: (v) => v.toJson()),
      'inviteCodeId': inviteCodeId,
      if (inviteCode != null) 'inviteCode': inviteCode?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.Friends>? friends,
    required int inviteCodeId,
    _i4.InviteCode? inviteCode,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          friends: friends,
          inviteCodeId: inviteCodeId,
          inviteCode: inviteCode,
        );

  @override
  User copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? friends = _Undefined,
    int? inviteCodeId,
    Object? inviteCode = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      friends: friends is List<_i3.Friends>?
          ? friends
          : this.friends?.map((e0) => e0.copyWith()).toList(),
      inviteCodeId: inviteCodeId ?? this.inviteCodeId,
      inviteCode: inviteCode is _i4.InviteCode?
          ? inviteCode
          : this.inviteCode?.copyWith(),
    );
  }
}
