import 'dart:math';

import 'package:friends_forever_server/src/generated/protocol.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

String _generateRandomString(int length) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}

Future<void> onUserCreated(Session session, auth.UserInfo userInfo) async {
  // generate random code
  var randomCode = _generateRandomString(5);

  // check if random code is unique
  while (await InviteCode.db
          .findFirstRow(session, where: (t) => t.code.equals(randomCode)) !=
      null) {
    randomCode = _generateRandomString(5);
  }
  if (userInfo.id != null) {
    final inviteCode = await InviteCode.db.insertRow(
        session, InviteCode(userInfoId: userInfo.id!, code: randomCode));

    final user = await User.db.insertRow(
        session,
        User(
          userInfoId: userInfo.id!,
          inviteCodeId: inviteCode.id!,
        ));
  }
}

Future<bool> onPasswordReset(session, userInfo, validationCode) async {
  // Retrieve the credentials
  final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
  final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

  // Create a SMTP client for Gmail.
  final smtpServer = gmail(gmailEmail, gmailPassword);

  // Create an email message with the password reset link.
  final message = Message()
    ..from = Address(gmailEmail)
    ..recipients.add(userInfo.email!)
    ..subject = 'Password reset link for Serverpod'
    ..html = 'Here is your password reset code: $validationCode';

  // Send the email message.
  try {
    await send(message, smtpServer);
  } catch (_) {
    // Return false if the email could not be sent.
    return false;
  }

  return true;
}

Future<bool> sendVerificationEmail(session, email, validationCode) async {
  // Retrieve the credentials
  final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
  final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

  // Create a SMTP client for Gmail.
  final smtpServer = gmail(gmailEmail, gmailPassword);

  // Create an email message with the validation code.
  final message = Message()
    ..from = Address(gmailEmail)
    ..recipients.add(email)
    ..subject = 'Verification code for Serverpod'
    ..html = 'Your verification code is: $validationCode';

  // Send the email message.
  try {
    await send(message, smtpServer);
  } catch (_) {
    // Return false if the email could not be sent.
    return false;
  }

  return true;
}

/// Extracts the authenticated user's ID from the session.
Future<int?> getAuthenticatedUserId(Session session) async {
  final authenticatedInfo = await session.authenticated;
  return authenticatedInfo?.userId;
}
