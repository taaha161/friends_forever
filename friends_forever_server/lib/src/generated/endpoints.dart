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
import '../endpoints/apology_endpoint.dart' as _i2;
import '../endpoints/bumps_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/friends_endpoint.dart' as _i5;
import '../endpoints/letter_endpoint.dart' as _i6;
import '../endpoints/user_endpoint.dart' as _i7;
import 'package:friends_forever_server/src/generated/apology_status.dart'
    as _i8;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'apology': _i2.ApologyEndpoint()
        ..initialize(
          server,
          'apology',
          null,
        ),
      'bumps': _i3.BumpsEndpoint()
        ..initialize(
          server,
          'bumps',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'friends': _i5.FriendsEndpoint()
        ..initialize(
          server,
          'friends',
          null,
        ),
      'letter': _i6.LetterEndpoint()
        ..initialize(
          server,
          'letter',
          null,
        ),
      'user': _i7.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['apology'] = _i1.EndpointConnector(
      name: 'apology',
      endpoint: endpoints['apology']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'recipientId': _i1.ParameterDescription(
              name: 'recipientId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'subject': _i1.ParameterDescription(
              name: 'subject',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['apology'] as _i2.ApologyEndpoint).create(
            session,
            params['recipientId'],
            params['message'],
            params['subject'],
          ),
        ),
        'read': _i1.MethodConnector(
          name: 'read',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['apology'] as _i2.ApologyEndpoint).read(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'subject': _i1.ParameterDescription(
              name: 'subject',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i8.ApologyStatus?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['apology'] as _i2.ApologyEndpoint).update(
            session,
            params['id'],
            message: params['message'],
            subject: params['subject'],
            status: params['status'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['apology'] as _i2.ApologyEndpoint).delete(
            session,
            params['id'],
          ),
        ),
        'recieved': _i1.MethodConnector(
          name: 'recieved',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['apology'] as _i2.ApologyEndpoint).recieved(session),
        ),
        'sent': _i1.MethodConnector(
          name: 'sent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['apology'] as _i2.ApologyEndpoint).sent(session),
        ),
      },
    );
    connectors['bumps'] = _i1.EndpointConnector(
      name: 'bumps',
      endpoint: endpoints['bumps']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'recipientId': _i1.ParameterDescription(
              name: 'recipientId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bumps'] as _i3.BumpsEndpoint).create(
            session,
            params['recipientId'],
          ),
        ),
        'recieved': _i1.MethodConnector(
          name: 'recieved',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bumps'] as _i3.BumpsEndpoint).recieved(session),
        ),
        'sent': _i1.MethodConnector(
          name: 'sent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bumps'] as _i3.BumpsEndpoint).sent(session),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['friends'] = _i1.EndpointConnector(
      name: 'friends',
      endpoint: endpoints['friends']!,
      methodConnectors: {
        'addFriend': _i1.MethodConnector(
          name: 'addFriend',
          params: {
            'inviteCode': _i1.ParameterDescription(
              name: 'inviteCode',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['friends'] as _i5.FriendsEndpoint).addFriend(
            session,
            params['inviteCode'],
          ),
        ),
        'removeFriend': _i1.MethodConnector(
          name: 'removeFriend',
          params: {
            'inviteCode': _i1.ParameterDescription(
              name: 'inviteCode',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['friends'] as _i5.FriendsEndpoint).removeFriend(
            session,
            params['inviteCode'],
          ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['friends'] as _i5.FriendsEndpoint).get(
            session,
            page: params['page'],
          ),
        ),
      },
    );
    connectors['letter'] = _i1.EndpointConnector(
      name: 'letter',
      endpoint: endpoints['letter']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'recipientId': _i1.ParameterDescription(
              name: 'recipientId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'subject': _i1.ParameterDescription(
              name: 'subject',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['letter'] as _i6.LetterEndpoint).create(
            session,
            params['recipientId'],
            params['message'],
            params['subject'],
          ),
        ),
        'read': _i1.MethodConnector(
          name: 'read',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['letter'] as _i6.LetterEndpoint).read(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'subject': _i1.ParameterDescription(
              name: 'subject',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['letter'] as _i6.LetterEndpoint).update(
            session,
            params['id'],
            message: params['message'],
            subject: params['subject'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['letter'] as _i6.LetterEndpoint).delete(
            session,
            params['id'],
          ),
        ),
        'recieved': _i1.MethodConnector(
          name: 'recieved',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['letter'] as _i6.LetterEndpoint).recieved(session),
        ),
        'sent': _i1.MethodConnector(
          name: 'sent',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['letter'] as _i6.LetterEndpoint).sent(session),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'get': _i1.MethodConnector(
          name: 'get',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).get(session),
        ),
        'verifyEmail': _i1.MethodConnector(
          name: 'verifyEmail',
          params: {
            'userInfo': _i1.ParameterDescription(
              name: 'userInfo',
              type: _i1.getType<_i9.UserInfo>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).verifyEmail(
            session,
            params['userInfo'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i9.Endpoints()..initializeEndpoints(server);
  }
}
