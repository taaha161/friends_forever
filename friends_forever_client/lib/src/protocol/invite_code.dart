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

abstract class InviteCode implements _i1.SerializableModel {
  InviteCode._({
    this.id,
    required this.userInfoId,
    this.userInfo,
    required this.code,
  });

  factory InviteCode({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String code,
  }) = _InviteCodeImpl;

  factory InviteCode.fromJson(Map<String, dynamic> jsonSerialization) {
    return InviteCode(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      code: jsonSerialization['code'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String code;

  InviteCode copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? code,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'code': code,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InviteCodeImpl extends InviteCode {
  _InviteCodeImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    required String code,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          code: code,
        );

  @override
  InviteCode copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    String? code,
  }) {
    return InviteCode(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      code: code ?? this.code,
    );
  }
}
