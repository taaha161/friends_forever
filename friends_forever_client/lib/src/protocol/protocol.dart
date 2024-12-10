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
import 'apology.dart' as _i2;
import 'apologystatus.dart' as _i3;
import 'bump.dart' as _i4;
import 'example.dart' as _i5;
import 'friends.dart' as _i6;
import 'invite_code.dart' as _i7;
import 'letter.dart' as _i8;
import 'user.dart' as _i9;
import 'package:friends_forever_client/src/protocol/apology.dart' as _i10;
import 'package:friends_forever_client/src/protocol/bump.dart' as _i11;
import 'package:friends_forever_client/src/protocol/letter.dart' as _i12;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i13;
export 'apology.dart';
export 'apologystatus.dart';
export 'bump.dart';
export 'example.dart';
export 'friends.dart';
export 'invite_code.dart';
export 'letter.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Apologies) {
      return _i2.Apologies.fromJson(data) as T;
    }
    if (t == _i3.ApologyStatus) {
      return _i3.ApologyStatus.fromJson(data) as T;
    }
    if (t == _i4.Bumps) {
      return _i4.Bumps.fromJson(data) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data) as T;
    }
    if (t == _i6.Friends) {
      return _i6.Friends.fromJson(data) as T;
    }
    if (t == _i7.InviteCode) {
      return _i7.InviteCode.fromJson(data) as T;
    }
    if (t == _i8.Letters) {
      return _i8.Letters.fromJson(data) as T;
    }
    if (t == _i9.User) {
      return _i9.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Apologies?>()) {
      return (data != null ? _i2.Apologies.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ApologyStatus?>()) {
      return (data != null ? _i3.ApologyStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Bumps?>()) {
      return (data != null ? _i4.Bumps.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Friends?>()) {
      return (data != null ? _i6.Friends.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.InviteCode?>()) {
      return (data != null ? _i7.InviteCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Letters?>()) {
      return (data != null ? _i8.Letters.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.User?>()) {
      return (data != null ? _i9.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i6.Friends>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.Friends>(e)).toList()
          : null) as dynamic;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i10.Apologies>) {
      return (data as List).map((e) => deserialize<_i10.Apologies>(e)).toList()
          as dynamic;
    }
    if (t == List<_i11.Bumps>) {
      return (data as List).map((e) => deserialize<_i11.Bumps>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.Letters>) {
      return (data as List).map((e) => deserialize<_i12.Letters>(e)).toList()
          as dynamic;
    }
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Apologies) {
      return 'Apologies';
    }
    if (data is _i3.ApologyStatus) {
      return 'ApologyStatus';
    }
    if (data is _i4.Bumps) {
      return 'Bumps';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.Friends) {
      return 'Friends';
    }
    if (data is _i7.InviteCode) {
      return 'InviteCode';
    }
    if (data is _i8.Letters) {
      return 'Letters';
    }
    if (data is _i9.User) {
      return 'User';
    }
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Apologies') {
      return deserialize<_i2.Apologies>(data['data']);
    }
    if (dataClassName == 'ApologyStatus') {
      return deserialize<_i3.ApologyStatus>(data['data']);
    }
    if (dataClassName == 'Bumps') {
      return deserialize<_i4.Bumps>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (dataClassName == 'Friends') {
      return deserialize<_i6.Friends>(data['data']);
    }
    if (dataClassName == 'InviteCode') {
      return deserialize<_i7.InviteCode>(data['data']);
    }
    if (dataClassName == 'Letters') {
      return deserialize<_i8.Letters>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i9.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
