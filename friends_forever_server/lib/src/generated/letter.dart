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

abstract class Letters implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = LettersTable();

  static const db = LettersRepository._();

  @override
  int? id;

  int senderId;

  _i2.User? sender;

  int recieverId;

  _i2.User? reciever;

  String message;

  String subject;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'senderId': senderId,
      if (sender != null) 'sender': sender?.toJsonForProtocol(),
      'recieverId': recieverId,
      if (reciever != null) 'reciever': reciever?.toJsonForProtocol(),
      'message': message,
      'subject': subject,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static LettersInclude include({
    _i2.UserInclude? sender,
    _i2.UserInclude? reciever,
  }) {
    return LettersInclude._(
      sender: sender,
      reciever: reciever,
    );
  }

  static LettersIncludeList includeList({
    _i1.WhereExpressionBuilder<LettersTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LettersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LettersTable>? orderByList,
    LettersInclude? include,
  }) {
    return LettersIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Letters.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Letters.t),
      include: include,
    );
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

class LettersTable extends _i1.Table {
  LettersTable({super.tableRelation}) : super(tableName: 'letters') {
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

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTable get sender {
    if (_sender != null) return _sender!;
    _sender = _i1.createRelationTable(
      relationFieldName: 'sender',
      field: Letters.t.senderId,
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
      field: Letters.t.recieverId,
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

class LettersInclude extends _i1.IncludeObject {
  LettersInclude._({
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
  _i1.Table get table => Letters.t;
}

class LettersIncludeList extends _i1.IncludeList {
  LettersIncludeList._({
    _i1.WhereExpressionBuilder<LettersTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Letters.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Letters.t;
}

class LettersRepository {
  const LettersRepository._();

  final attachRow = const LettersAttachRowRepository._();

  Future<List<Letters>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LettersTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LettersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LettersTable>? orderByList,
    _i1.Transaction? transaction,
    LettersInclude? include,
  }) async {
    return session.db.find<Letters>(
      where: where?.call(Letters.t),
      orderBy: orderBy?.call(Letters.t),
      orderByList: orderByList?.call(Letters.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Letters?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LettersTable>? where,
    int? offset,
    _i1.OrderByBuilder<LettersTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LettersTable>? orderByList,
    _i1.Transaction? transaction,
    LettersInclude? include,
  }) async {
    return session.db.findFirstRow<Letters>(
      where: where?.call(Letters.t),
      orderBy: orderBy?.call(Letters.t),
      orderByList: orderByList?.call(Letters.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Letters?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    LettersInclude? include,
  }) async {
    return session.db.findById<Letters>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Letters>> insert(
    _i1.Session session,
    List<Letters> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Letters>(
      rows,
      transaction: transaction,
    );
  }

  Future<Letters> insertRow(
    _i1.Session session,
    Letters row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Letters>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Letters>> update(
    _i1.Session session,
    List<Letters> rows, {
    _i1.ColumnSelections<LettersTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Letters>(
      rows,
      columns: columns?.call(Letters.t),
      transaction: transaction,
    );
  }

  Future<Letters> updateRow(
    _i1.Session session,
    Letters row, {
    _i1.ColumnSelections<LettersTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Letters>(
      row,
      columns: columns?.call(Letters.t),
      transaction: transaction,
    );
  }

  Future<List<Letters>> delete(
    _i1.Session session,
    List<Letters> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Letters>(
      rows,
      transaction: transaction,
    );
  }

  Future<Letters> deleteRow(
    _i1.Session session,
    Letters row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Letters>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Letters>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LettersTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Letters>(
      where: where(Letters.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LettersTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Letters>(
      where: where?.call(Letters.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class LettersAttachRowRepository {
  const LettersAttachRowRepository._();

  Future<void> sender(
    _i1.Session session,
    Letters letters,
    _i2.User sender, {
    _i1.Transaction? transaction,
  }) async {
    if (letters.id == null) {
      throw ArgumentError.notNull('letters.id');
    }
    if (sender.id == null) {
      throw ArgumentError.notNull('sender.id');
    }

    var $letters = letters.copyWith(senderId: sender.id);
    await session.db.updateRow<Letters>(
      $letters,
      columns: [Letters.t.senderId],
      transaction: transaction,
    );
  }

  Future<void> reciever(
    _i1.Session session,
    Letters letters,
    _i2.User reciever, {
    _i1.Transaction? transaction,
  }) async {
    if (letters.id == null) {
      throw ArgumentError.notNull('letters.id');
    }
    if (reciever.id == null) {
      throw ArgumentError.notNull('reciever.id');
    }

    var $letters = letters.copyWith(recieverId: reciever.id);
    await session.db.updateRow<Letters>(
      $letters,
      columns: [Letters.t.recieverId],
      transaction: transaction,
    );
  }
}
