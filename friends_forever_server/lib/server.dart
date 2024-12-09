import 'dart:math';

import 'package:friends_forever_server/src/utils/utils.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';

import 'package:friends_forever_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

void run(List<String> args) async {
  auth.AuthConfig.set(auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        print(validationCode);
        return true;
      },
      sendPasswordResetEmail: onPasswordReset,
      onUserCreated: onUserCreated));

  final pod = Serverpod(args, Protocol(), Endpoints(),
      authenticationHandler: auth.authenticationHandler);

  await pod.start();
}
