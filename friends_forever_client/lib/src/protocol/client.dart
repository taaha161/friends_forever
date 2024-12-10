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
import 'dart:async' as _i2;
import 'package:friends_forever_client/src/protocol/apology.dart' as _i3;
import 'package:friends_forever_client/src/protocol/apologystatus.dart' as _i4;
import 'package:friends_forever_client/src/protocol/bump.dart' as _i5;
import 'package:friends_forever_client/src/protocol/letter.dart' as _i6;
import 'package:friends_forever_client/src/protocol/user.dart' as _i7;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i8;
import 'protocol.dart' as _i9;

/// {@category Endpoint}
class EndpointApology extends _i1.EndpointRef {
  EndpointApology(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'apology';

  _i2.Future<Map<String, String>> create(
    int recipientId,
    String message,
    String subject,
  ) =>
      caller.callServerEndpoint<Map<String, String>>(
        'apology',
        'create',
        {
          'recipientId': recipientId,
          'message': message,
          'subject': subject,
        },
      );

  _i2.Future<_i3.Apologies?> read(int id) =>
      caller.callServerEndpoint<_i3.Apologies?>(
        'apology',
        'read',
        {'id': id},
      );

  _i2.Future<Map<String, String>> update(
    int id, {
    String? message,
    String? subject,
    _i4.ApologyStatus? status,
  }) =>
      caller.callServerEndpoint<Map<String, String>>(
        'apology',
        'update',
        {
          'id': id,
          'message': message,
          'subject': subject,
          'status': status,
        },
      );

  _i2.Future<Map<String, String>> delete(int id) =>
      caller.callServerEndpoint<Map<String, String>>(
        'apology',
        'delete',
        {'id': id},
      );

  _i2.Future<List<_i3.Apologies>> recieved() =>
      caller.callServerEndpoint<List<_i3.Apologies>>(
        'apology',
        'recieved',
        {},
      );

  _i2.Future<List<_i3.Apologies>> sent() =>
      caller.callServerEndpoint<List<_i3.Apologies>>(
        'apology',
        'sent',
        {},
      );
}

/// {@category Endpoint}
class EndpointBumps extends _i1.EndpointRef {
  EndpointBumps(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bumps';

  _i2.Future<Map<String, String>> create(int recipientId) =>
      caller.callServerEndpoint<Map<String, String>>(
        'bumps',
        'create',
        {'recipientId': recipientId},
      );

  _i2.Future<List<_i5.Bumps>> recieved() =>
      caller.callServerEndpoint<List<_i5.Bumps>>(
        'bumps',
        'recieved',
        {},
      );

  _i2.Future<List<_i5.Bumps>> sent() =>
      caller.callServerEndpoint<List<_i5.Bumps>>(
        'bumps',
        'sent',
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointFriends extends _i1.EndpointRef {
  EndpointFriends(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'friends';

  /// Fetches the authenticated user and their details, including friends, invite codes, etc.
  /// [page] is used for pagination.
  /// Adds a friend based on the provided [inviteCode].
  /// Returns a success or error message in a map.
  _i2.Future<Map<String, String>> addFriend(String inviteCode) =>
      caller.callServerEndpoint<Map<String, String>>(
        'friends',
        'addFriend',
        {'inviteCode': inviteCode},
      );

  _i2.Future<Map<String, String>> removeFriend(String inviteCode) =>
      caller.callServerEndpoint<Map<String, String>>(
        'friends',
        'removeFriend',
        {'inviteCode': inviteCode},
      );
}

/// {@category Endpoint}
class EndpointLetter extends _i1.EndpointRef {
  EndpointLetter(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'letter';

  _i2.Future<Map<String, String>> create(
    int recipientId,
    String message,
    String subject,
  ) =>
      caller.callServerEndpoint<Map<String, String>>(
        'letter',
        'create',
        {
          'recipientId': recipientId,
          'message': message,
          'subject': subject,
        },
      );

  _i2.Future<_i6.Letters?> read(int id) =>
      caller.callServerEndpoint<_i6.Letters?>(
        'letter',
        'read',
        {'id': id},
      );

  _i2.Future<Map<String, String>> update(
    int id, {
    String? message,
    String? subject,
  }) =>
      caller.callServerEndpoint<Map<String, String>>(
        'letter',
        'update',
        {
          'id': id,
          'message': message,
          'subject': subject,
        },
      );

  _i2.Future<Map<String, String>> delete(int id) =>
      caller.callServerEndpoint<Map<String, String>>(
        'letter',
        'delete',
        {'id': id},
      );

  _i2.Future<List<_i6.Letters>> recieved() =>
      caller.callServerEndpoint<List<_i6.Letters>>(
        'letter',
        'recieved',
        {},
      );

  _i2.Future<List<_i6.Letters>> sent() =>
      caller.callServerEndpoint<List<_i6.Letters>>(
        'letter',
        'sent',
        {},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  /// Fetches the authenticated user and their details, including friends, invite codes, etc.
  /// [page] is used for pagination.
  _i2.Future<_i7.User?> get({required int page}) =>
      caller.callServerEndpoint<_i7.User?>(
        'user',
        'get',
        {'page': page},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i8.Caller(client);
  }

  late final _i8.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i9.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    apology = EndpointApology(this);
    bumps = EndpointBumps(this);
    example = EndpointExample(this);
    friends = EndpointFriends(this);
    letter = EndpointLetter(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointApology apology;

  late final EndpointBumps bumps;

  late final EndpointExample example;

  late final EndpointFriends friends;

  late final EndpointLetter letter;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'apology': apology,
        'bumps': bumps,
        'example': example,
        'friends': friends,
        'letter': letter,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
