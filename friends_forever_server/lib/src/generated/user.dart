/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'friends.dart' as _i3;
import 'invite_code.dart' as _i4;

abstract class User implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  List<_i3.Friends>? friends;

  int inviteCodeId;

  _i4.InviteCode? inviteCode;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (friends != null)
        'friends': friends?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'inviteCodeId': inviteCodeId,
      if (inviteCode != null) 'inviteCode': inviteCode?.toJsonForProtocol(),
    };
  }

  static UserInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.FriendsIncludeList? friends,
    _i4.InviteCodeInclude? inviteCode,
  }) {
    return UserInclude._(
      userInfo: userInfo,
      friends: friends,
      inviteCode: inviteCode,
    );
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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

class UserTable extends _i1.Table {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    inviteCodeId = _i1.ColumnInt(
      'inviteCodeId',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i3.FriendsTable? ___friends;

  _i1.ManyRelation<_i3.FriendsTable>? _friends;

  late final _i1.ColumnInt inviteCodeId;

  _i4.InviteCodeTable? _inviteCode;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: User.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.FriendsTable get __friends {
    if (___friends != null) return ___friends!;
    ___friends = _i1.createRelationTable(
      relationFieldName: '__friends',
      field: User.t.id,
      foreignField: _i3.Friends.t.friendId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.FriendsTable(tableRelation: foreignTableRelation),
    );
    return ___friends!;
  }

  _i4.InviteCodeTable get inviteCode {
    if (_inviteCode != null) return _inviteCode!;
    _inviteCode = _i1.createRelationTable(
      relationFieldName: 'inviteCode',
      field: User.t.inviteCodeId,
      foreignField: _i4.InviteCode.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.InviteCodeTable(tableRelation: foreignTableRelation),
    );
    return _inviteCode!;
  }

  _i1.ManyRelation<_i3.FriendsTable> get friends {
    if (_friends != null) return _friends!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'friends',
      field: User.t.id,
      foreignField: _i3.Friends.t.friendId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.FriendsTable(tableRelation: foreignTableRelation),
    );
    _friends = _i1.ManyRelation<_i3.FriendsTable>(
      tableWithRelations: relationTable,
      table: _i3.FriendsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _friends!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        inviteCodeId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'friends') {
      return __friends;
    }
    if (relationField == 'inviteCode') {
      return inviteCode;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.FriendsIncludeList? friends,
    _i4.InviteCodeInclude? inviteCode,
  }) {
    _userInfo = userInfo;
    _friends = friends;
    _inviteCode = inviteCode;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.FriendsIncludeList? _friends;

  _i4.InviteCodeInclude? _inviteCode;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'friends': _friends,
        'inviteCode': _inviteCode,
      };

  @override
  _i1.Table get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  Future<void> friends(
    _i1.Session session,
    User user,
    List<_i3.Friends> friends, {
    _i1.Transaction? transaction,
  }) async {
    if (friends.any((e) => e.id == null)) {
      throw ArgumentError.notNull('friends.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $friends = friends.map((e) => e.copyWith(friendId: user.id)).toList();
    await session.db.update<_i3.Friends>(
      $friends,
      columns: [_i3.Friends.t.friendId],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    User user,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $user = user.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.userInfoId],
      transaction: transaction,
    );
  }

  Future<void> inviteCode(
    _i1.Session session,
    User user,
    _i4.InviteCode inviteCode, {
    _i1.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (inviteCode.id == null) {
      throw ArgumentError.notNull('inviteCode.id');
    }

    var $user = user.copyWith(inviteCodeId: inviteCode.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.inviteCodeId],
      transaction: transaction,
    );
  }

  Future<void> friends(
    _i1.Session session,
    User user,
    _i3.Friends friends, {
    _i1.Transaction? transaction,
  }) async {
    if (friends.id == null) {
      throw ArgumentError.notNull('friends.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $friends = friends.copyWith(friendId: user.id);
    await session.db.updateRow<_i3.Friends>(
      $friends,
      columns: [_i3.Friends.t.friendId],
      transaction: transaction,
    );
  }
}
