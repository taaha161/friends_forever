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

abstract class InviteCode implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = InviteCodeTable();

  static const db = InviteCodeRepository._();

  @override
  int? id;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String code;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'code': code,
    };
  }

  static InviteCodeInclude include({_i2.UserInfoInclude? userInfo}) {
    return InviteCodeInclude._(userInfo: userInfo);
  }

  static InviteCodeIncludeList includeList({
    _i1.WhereExpressionBuilder<InviteCodeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InviteCodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InviteCodeTable>? orderByList,
    InviteCodeInclude? include,
  }) {
    return InviteCodeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InviteCode.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(InviteCode.t),
      include: include,
    );
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

class InviteCodeTable extends _i1.Table {
  InviteCodeTable({super.tableRelation}) : super(tableName: 'invite_code') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    code = _i1.ColumnString(
      'code',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString code;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: InviteCode.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        code,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    return null;
  }
}

class InviteCodeInclude extends _i1.IncludeObject {
  InviteCodeInclude._({_i2.UserInfoInclude? userInfo}) {
    _userInfo = userInfo;
  }

  _i2.UserInfoInclude? _userInfo;

  @override
  Map<String, _i1.Include?> get includes => {'userInfo': _userInfo};

  @override
  _i1.Table get table => InviteCode.t;
}

class InviteCodeIncludeList extends _i1.IncludeList {
  InviteCodeIncludeList._({
    _i1.WhereExpressionBuilder<InviteCodeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(InviteCode.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => InviteCode.t;
}

class InviteCodeRepository {
  const InviteCodeRepository._();

  final attachRow = const InviteCodeAttachRowRepository._();

  Future<List<InviteCode>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InviteCodeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InviteCodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InviteCodeTable>? orderByList,
    _i1.Transaction? transaction,
    InviteCodeInclude? include,
  }) async {
    return session.db.find<InviteCode>(
      where: where?.call(InviteCode.t),
      orderBy: orderBy?.call(InviteCode.t),
      orderByList: orderByList?.call(InviteCode.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<InviteCode?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InviteCodeTable>? where,
    int? offset,
    _i1.OrderByBuilder<InviteCodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InviteCodeTable>? orderByList,
    _i1.Transaction? transaction,
    InviteCodeInclude? include,
  }) async {
    return session.db.findFirstRow<InviteCode>(
      where: where?.call(InviteCode.t),
      orderBy: orderBy?.call(InviteCode.t),
      orderByList: orderByList?.call(InviteCode.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<InviteCode?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    InviteCodeInclude? include,
  }) async {
    return session.db.findById<InviteCode>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<InviteCode>> insert(
    _i1.Session session,
    List<InviteCode> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<InviteCode>(
      rows,
      transaction: transaction,
    );
  }

  Future<InviteCode> insertRow(
    _i1.Session session,
    InviteCode row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<InviteCode>(
      row,
      transaction: transaction,
    );
  }

  Future<List<InviteCode>> update(
    _i1.Session session,
    List<InviteCode> rows, {
    _i1.ColumnSelections<InviteCodeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<InviteCode>(
      rows,
      columns: columns?.call(InviteCode.t),
      transaction: transaction,
    );
  }

  Future<InviteCode> updateRow(
    _i1.Session session,
    InviteCode row, {
    _i1.ColumnSelections<InviteCodeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<InviteCode>(
      row,
      columns: columns?.call(InviteCode.t),
      transaction: transaction,
    );
  }

  Future<List<InviteCode>> delete(
    _i1.Session session,
    List<InviteCode> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<InviteCode>(
      rows,
      transaction: transaction,
    );
  }

  Future<InviteCode> deleteRow(
    _i1.Session session,
    InviteCode row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<InviteCode>(
      row,
      transaction: transaction,
    );
  }

  Future<List<InviteCode>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<InviteCodeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<InviteCode>(
      where: where(InviteCode.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InviteCodeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<InviteCode>(
      where: where?.call(InviteCode.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class InviteCodeAttachRowRepository {
  const InviteCodeAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    InviteCode inviteCode,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (inviteCode.id == null) {
      throw ArgumentError.notNull('inviteCode.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $inviteCode = inviteCode.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<InviteCode>(
      $inviteCode,
      columns: [InviteCode.t.userInfoId],
      transaction: transaction,
    );
  }
}
