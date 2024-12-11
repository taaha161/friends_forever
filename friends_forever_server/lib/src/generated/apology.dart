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
import 'apology_status.dart' as _i3;

abstract class Apologies implements _i1.TableRow, _i1.ProtocolSerialization {
  Apologies._({
    this.id,
    required this.senderId,
    this.sender,
    required this.recieverId,
    this.reciever,
    required this.message,
    required this.subject,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Apologies({
    int? id,
    required int senderId,
    _i2.User? sender,
    required int recieverId,
    _i2.User? reciever,
    required String message,
    required String subject,
    required _i3.ApologyStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ApologiesImpl;

  factory Apologies.fromJson(Map<String, dynamic> jsonSerialization) {
    return Apologies(
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
      status:
          _i3.ApologyStatus.fromJson((jsonSerialization['status'] as String)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = ApologiesTable();

  static const db = ApologiesRepository._();

  @override
  int? id;

  int senderId;

  _i2.User? sender;

  int recieverId;

  _i2.User? reciever;

  String message;

  String subject;

  _i3.ApologyStatus status;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

  Apologies copyWith({
    int? id,
    int? senderId,
    _i2.User? sender,
    int? recieverId,
    _i2.User? reciever,
    String? message,
    String? subject,
    _i3.ApologyStatus? status,
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
      'status': status.toJson(),
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
      'message': message,
      'subject': subject,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static ApologiesInclude include({
    _i2.UserInclude? sender,
    _i2.UserInclude? reciever,
  }) {
    return ApologiesInclude._(
      sender: sender,
      reciever: reciever,
    );
  }

  static ApologiesIncludeList includeList({
    _i1.WhereExpressionBuilder<ApologiesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApologiesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApologiesTable>? orderByList,
    ApologiesInclude? include,
  }) {
    return ApologiesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Apologies.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Apologies.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ApologiesImpl extends Apologies {
  _ApologiesImpl({
    int? id,
    required int senderId,
    _i2.User? sender,
    required int recieverId,
    _i2.User? reciever,
    required String message,
    required String subject,
    required _i3.ApologyStatus status,
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
          status: status,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Apologies copyWith({
    Object? id = _Undefined,
    int? senderId,
    Object? sender = _Undefined,
    int? recieverId,
    Object? reciever = _Undefined,
    String? message,
    String? subject,
    _i3.ApologyStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Apologies(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      sender: sender is _i2.User? ? sender : this.sender?.copyWith(),
      recieverId: recieverId ?? this.recieverId,
      reciever: reciever is _i2.User? ? reciever : this.reciever?.copyWith(),
      message: message ?? this.message,
      subject: subject ?? this.subject,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class ApologiesTable extends _i1.Table {
  ApologiesTable({super.tableRelation}) : super(tableName: 'apologies') {
    senderId = _i1.ColumnInt(
      'senderId',
      this,
    );
    recieverId = _i1.ColumnInt(
      'recieverId',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    subject = _i1.ColumnString(
      'subject',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
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

  late final _i1.ColumnString message;

  late final _i1.ColumnString subject;

  late final _i1.ColumnEnum<_i3.ApologyStatus> status;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTable get sender {
    if (_sender != null) return _sender!;
    _sender = _i1.createRelationTable(
      relationFieldName: 'sender',
      field: Apologies.t.senderId,
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
      field: Apologies.t.recieverId,
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
        message,
        subject,
        status,
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

class ApologiesInclude extends _i1.IncludeObject {
  ApologiesInclude._({
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
  _i1.Table get table => Apologies.t;
}

class ApologiesIncludeList extends _i1.IncludeList {
  ApologiesIncludeList._({
    _i1.WhereExpressionBuilder<ApologiesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Apologies.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Apologies.t;
}

class ApologiesRepository {
  const ApologiesRepository._();

  final attachRow = const ApologiesAttachRowRepository._();

  Future<List<Apologies>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ApologiesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApologiesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApologiesTable>? orderByList,
    _i1.Transaction? transaction,
    ApologiesInclude? include,
  }) async {
    return session.db.find<Apologies>(
      where: where?.call(Apologies.t),
      orderBy: orderBy?.call(Apologies.t),
      orderByList: orderByList?.call(Apologies.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Apologies?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ApologiesTable>? where,
    int? offset,
    _i1.OrderByBuilder<ApologiesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApologiesTable>? orderByList,
    _i1.Transaction? transaction,
    ApologiesInclude? include,
  }) async {
    return session.db.findFirstRow<Apologies>(
      where: where?.call(Apologies.t),
      orderBy: orderBy?.call(Apologies.t),
      orderByList: orderByList?.call(Apologies.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Apologies?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ApologiesInclude? include,
  }) async {
    return session.db.findById<Apologies>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Apologies>> insert(
    _i1.Session session,
    List<Apologies> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Apologies>(
      rows,
      transaction: transaction,
    );
  }

  Future<Apologies> insertRow(
    _i1.Session session,
    Apologies row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Apologies>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Apologies>> update(
    _i1.Session session,
    List<Apologies> rows, {
    _i1.ColumnSelections<ApologiesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Apologies>(
      rows,
      columns: columns?.call(Apologies.t),
      transaction: transaction,
    );
  }

  Future<Apologies> updateRow(
    _i1.Session session,
    Apologies row, {
    _i1.ColumnSelections<ApologiesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Apologies>(
      row,
      columns: columns?.call(Apologies.t),
      transaction: transaction,
    );
  }

  Future<List<Apologies>> delete(
    _i1.Session session,
    List<Apologies> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Apologies>(
      rows,
      transaction: transaction,
    );
  }

  Future<Apologies> deleteRow(
    _i1.Session session,
    Apologies row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Apologies>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Apologies>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ApologiesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Apologies>(
      where: where(Apologies.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ApologiesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Apologies>(
      where: where?.call(Apologies.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ApologiesAttachRowRepository {
  const ApologiesAttachRowRepository._();

  Future<void> sender(
    _i1.Session session,
    Apologies apologies,
    _i2.User sender, {
    _i1.Transaction? transaction,
  }) async {
    if (apologies.id == null) {
      throw ArgumentError.notNull('apologies.id');
    }
    if (sender.id == null) {
      throw ArgumentError.notNull('sender.id');
    }

    var $apologies = apologies.copyWith(senderId: sender.id);
    await session.db.updateRow<Apologies>(
      $apologies,
      columns: [Apologies.t.senderId],
      transaction: transaction,
    );
  }

  Future<void> reciever(
    _i1.Session session,
    Apologies apologies,
    _i2.User reciever, {
    _i1.Transaction? transaction,
  }) async {
    if (apologies.id == null) {
      throw ArgumentError.notNull('apologies.id');
    }
    if (reciever.id == null) {
      throw ArgumentError.notNull('reciever.id');
    }

    var $apologies = apologies.copyWith(recieverId: reciever.id);
    await session.db.updateRow<Apologies>(
      $apologies,
      columns: [Apologies.t.recieverId],
      transaction: transaction,
    );
  }
}
