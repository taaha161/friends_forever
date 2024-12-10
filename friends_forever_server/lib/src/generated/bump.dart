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

abstract class Bumps implements _i1.TableRow, _i1.ProtocolSerialization {
  Bumps._({
    this.id,
    required this.senderId,
    this.sender,
    required this.recieverId,
    this.reciever,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Bumps({
    int? id,
    required int senderId,
    _i2.User? sender,
    required int recieverId,
    _i2.User? reciever,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BumpsImpl;

  factory Bumps.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bumps(
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
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = BumpsTable();

  static const db = BumpsRepository._();

  @override
  int? id;

  int senderId;

  _i2.User? sender;

  int recieverId;

  _i2.User? reciever;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  Bumps copyWith({
    int? id,
    int? senderId,
    _i2.User? sender,
    int? recieverId,
    _i2.User? reciever,
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
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJsonForProtocol(),
      'recieverId': recieverId,
      if (reciever != null) 'reciever': reciever?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static BumpsInclude include({
    _i2.UserInclude? sender,
    _i2.UserInclude? reciever,
  }) {
    return BumpsInclude._(
      sender: sender,
      reciever: reciever,
    );
  }

  static BumpsIncludeList includeList({
    _i1.WhereExpressionBuilder<BumpsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BumpsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BumpsTable>? orderByList,
    BumpsInclude? include,
  }) {
    return BumpsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bumps.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Bumps.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BumpsImpl extends Bumps {
  _BumpsImpl({
    int? id,
    required int senderId,
    _i2.User? sender,
    required int recieverId,
    _i2.User? reciever,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          senderId: senderId,
          sender: sender,
          recieverId: recieverId,
          reciever: reciever,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Bumps copyWith({
    Object? id = _Undefined,
    int? senderId,
    Object? sender = _Undefined,
    int? recieverId,
    Object? reciever = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Bumps(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      sender: sender is _i2.User? ? sender : this.sender?.copyWith(),
      recieverId: recieverId ?? this.recieverId,
      reciever: reciever is _i2.User? ? reciever : this.reciever?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class BumpsTable extends _i1.Table {
  BumpsTable({super.tableRelation}) : super(tableName: 'bumps') {
    senderId = _i1.ColumnInt(
      'senderId',
      this,
    );
    recieverId = _i1.ColumnInt(
      'recieverId',
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
  }

  late final _i1.ColumnInt senderId;

  _i2.UserTable? _sender;

  late final _i1.ColumnInt recieverId;

  _i2.UserTable? _reciever;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTable get sender {
    if (_sender != null) return _sender!;
    _sender = _i1.createRelationTable(
      relationFieldName: 'sender',
      field: Bumps.t.senderId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _sender!;
  }

  _i2.UserTable get reciever {
    if (_reciever != null) return _reciever!;
    _reciever = _i1.createRelationTable(
      relationFieldName: 'reciever',
      field: Bumps.t.recieverId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _reciever!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        senderId,
        recieverId,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'sender') {
      return sender;
    }
    if (relationField == 'reciever') {
      return reciever;
    }
    return null;
  }
}

class BumpsInclude extends _i1.IncludeObject {
  BumpsInclude._({
    _i2.UserInclude? sender,
    _i2.UserInclude? reciever,
  }) {
    _sender = sender;
    _reciever = reciever;
  }

  _i2.UserInclude? _sender;

  _i2.UserInclude? _reciever;

  @override
  Map<String, _i1.Include?> get includes => {
        'sender': _sender,
        'reciever': _reciever,
      };

  @override
  _i1.Table get table => Bumps.t;
}

class BumpsIncludeList extends _i1.IncludeList {
  BumpsIncludeList._({
    _i1.WhereExpressionBuilder<BumpsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Bumps.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Bumps.t;
}

class BumpsRepository {
  const BumpsRepository._();

  final attachRow = const BumpsAttachRowRepository._();

  Future<List<Bumps>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BumpsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BumpsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BumpsTable>? orderByList,
    _i1.Transaction? transaction,
    BumpsInclude? include,
  }) async {
    return session.db.find<Bumps>(
      where: where?.call(Bumps.t),
      orderBy: orderBy?.call(Bumps.t),
      orderByList: orderByList?.call(Bumps.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Bumps?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BumpsTable>? where,
    int? offset,
    _i1.OrderByBuilder<BumpsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BumpsTable>? orderByList,
    _i1.Transaction? transaction,
    BumpsInclude? include,
  }) async {
    return session.db.findFirstRow<Bumps>(
      where: where?.call(Bumps.t),
      orderBy: orderBy?.call(Bumps.t),
      orderByList: orderByList?.call(Bumps.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Bumps?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BumpsInclude? include,
  }) async {
    return session.db.findById<Bumps>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Bumps>> insert(
    _i1.Session session,
    List<Bumps> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Bumps>(
      rows,
      transaction: transaction,
    );
  }

  Future<Bumps> insertRow(
    _i1.Session session,
    Bumps row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Bumps>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Bumps>> update(
    _i1.Session session,
    List<Bumps> rows, {
    _i1.ColumnSelections<BumpsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Bumps>(
      rows,
      columns: columns?.call(Bumps.t),
      transaction: transaction,
    );
  }

  Future<Bumps> updateRow(
    _i1.Session session,
    Bumps row, {
    _i1.ColumnSelections<BumpsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Bumps>(
      row,
      columns: columns?.call(Bumps.t),
      transaction: transaction,
    );
  }

  Future<List<Bumps>> delete(
    _i1.Session session,
    List<Bumps> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Bumps>(
      rows,
      transaction: transaction,
    );
  }

  Future<Bumps> deleteRow(
    _i1.Session session,
    Bumps row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Bumps>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Bumps>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BumpsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Bumps>(
      where: where(Bumps.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BumpsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Bumps>(
      where: where?.call(Bumps.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BumpsAttachRowRepository {
  const BumpsAttachRowRepository._();

  Future<void> sender(
    _i1.Session session,
    Bumps bumps,
    _i2.User sender, {
    _i1.Transaction? transaction,
  }) async {
    if (bumps.id == null) {
      throw ArgumentError.notNull('bumps.id');
    }
    if (sender.id == null) {
      throw ArgumentError.notNull('sender.id');
    }

    var $bumps = bumps.copyWith(senderId: sender.id);
    await session.db.updateRow<Bumps>(
      $bumps,
      columns: [Bumps.t.senderId],
      transaction: transaction,
    );
  }

  Future<void> reciever(
    _i1.Session session,
    Bumps bumps,
    _i2.User reciever, {
    _i1.Transaction? transaction,
  }) async {
    if (bumps.id == null) {
      throw ArgumentError.notNull('bumps.id');
    }
    if (reciever.id == null) {
      throw ArgumentError.notNull('reciever.id');
    }

    var $bumps = bumps.copyWith(recieverId: reciever.id);
    await session.db.updateRow<Bumps>(
      $bumps,
      columns: [Bumps.t.recieverId],
      transaction: transaction,
    );
  }
}
