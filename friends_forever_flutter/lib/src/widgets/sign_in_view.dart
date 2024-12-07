import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:friends_forever_flutter/src/serverpod_client.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: Container(
          width: 260,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SignInWithEmailButton(
                caller: client.modules.auth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
