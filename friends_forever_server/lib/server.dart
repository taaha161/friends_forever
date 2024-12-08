import 'dart:math';

import 'package:friends_forever_server/src/utils/utils.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';

import 'package:friends_forever_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  auth.AuthConfig.set(auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        print(validationCode);
        return true;
      },
      //sendVerificationEmail,
      sendPasswordResetEmail: onPasswordReset,
      onUserCreated: onUserCreated));
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints(),
      authenticationHandler: auth.authenticationHandler);

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Start the server.
  await pod.start();
}
