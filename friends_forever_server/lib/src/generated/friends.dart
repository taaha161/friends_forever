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
import 'user.dart' as _i2;

abstract class Friends implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = FriendsTable();

  static const db = FriendsRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  int friendId;

  _i2.User? friend;

  DateTime createdAt;

  DateTime updatedAt;

  DateTime? deletedAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'friendId': friendId,
      if (friend != null) 'friend': friend?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  static FriendsInclude include({
    _i2.UserInclude? user,
    _i2.UserInclude? friend,
  }) {
    return FriendsInclude._(
      user: user,
      friend: friend,
    );
  }

  static FriendsIncludeList includeList({
    _i1.WhereExpressionBuilder<FriendsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FriendsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FriendsTable>? orderByList,
    FriendsInclude? include,
  }) {
    return FriendsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Friends.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Friends.t),
      include: include,
    );
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

class FriendsTable extends _i1.Table {
  FriendsTable({super.tableRelation}) : super(tableName: 'friends') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    friendId = _i1.ColumnInt(
      'friendId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnInt friendId;

  _i2.UserTable? _friend;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnDateTime deletedAt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Friends.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i2.UserTable get friend {
    if (_friend != null) return _friend!;
    _friend = _i1.createRelationTable(
      relationFieldName: 'friend',
      field: Friends.t.friendId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _friend!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        friendId,
        createdAt,
        updatedAt,
        deletedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'friend') {
      return friend;
    }
    return null;
  }
}

class FriendsInclude extends _i1.IncludeObject {
  FriendsInclude._({
    _i2.UserInclude? user,
    _i2.UserInclude? friend,
  }) {
    _user = user;
    _friend = friend;
  }

  _i2.UserInclude? _user;

  _i2.UserInclude? _friend;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'friend': _friend,
      };

  @override
  _i1.Table get table => Friends.t;
}

class FriendsIncludeList extends _i1.IncludeList {
  FriendsIncludeList._({
    _i1.WhereExpressionBuilder<FriendsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Friends.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Friends.t;
}

class FriendsRepository {
  const FriendsRepository._();

  final attachRow = const FriendsAttachRowRepository._();

  Future<List<Friends>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FriendsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FriendsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FriendsTable>? orderByList,
    _i1.Transaction? transaction,
    FriendsInclude? include,
  }) async {
    return session.db.find<Friends>(
      where: where?.call(Friends.t),
      orderBy: orderBy?.call(Friends.t),
      orderByList: orderByList?.call(Friends.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Friends?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FriendsTable>? where,
    int? offset,
    _i1.OrderByBuilder<FriendsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FriendsTable>? orderByList,
    _i1.Transaction? transaction,
    FriendsInclude? include,
  }) async {
    return session.db.findFirstRow<Friends>(
      where: where?.call(Friends.t),
      orderBy: orderBy?.call(Friends.t),
      orderByList: orderByList?.call(Friends.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Friends?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    FriendsInclude? include,
  }) async {
    return session.db.findById<Friends>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Friends>> insert(
    _i1.Session session,
    List<Friends> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Friends>(
      rows,
      transaction: transaction,
    );
  }

  Future<Friends> insertRow(
    _i1.Session session,
    Friends row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Friends>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Friends>> update(
    _i1.Session session,
    List<Friends> rows, {
    _i1.ColumnSelections<FriendsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Friends>(
      rows,
      columns: columns?.call(Friends.t),
      transaction: transaction,
    );
  }

  Future<Friends> updateRow(
    _i1.Session session,
    Friends row, {
    _i1.ColumnSelections<FriendsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Friends>(
      row,
      columns: columns?.call(Friends.t),
      transaction: transaction,
    );
  }

  Future<List<Friends>> delete(
    _i1.Session session,
    List<Friends> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Friends>(
      rows,
      transaction: transaction,
    );
  }

  Future<Friends> deleteRow(
    _i1.Session session,
    Friends row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Friends>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Friends>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FriendsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Friends>(
      where: where(Friends.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FriendsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Friends>(
      where: where?.call(Friends.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class FriendsAttachRowRepository {
  const FriendsAttachRowRepository._();

  Future<void> user(
    _i1.Session session,
    Friends friends,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (friends.id == null) {
      throw ArgumentError.notNull('friends.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $friends = friends.copyWith(userId: user.id);
    await session.db.updateRow<Friends>(
      $friends,
      columns: [Friends.t.userId],
      transaction: transaction,
    );
  }

  Future<void> friend(
    _i1.Session session,
    Friends friends,
    _i2.User friend, {
    _i1.Transaction? transaction,
  }) async {
    if (friends.id == null) {
      throw ArgumentError.notNull('friends.id');
    }
    if (friend.id == null) {
      throw ArgumentError.notNull('friend.id');
    }

    var $friends = friends.copyWith(friendId: friend.id);
    await session.db.updateRow<Friends>(
      $friends,
      columns: [Friends.t.friendId],
      transaction: transaction,
    );
  }
}
