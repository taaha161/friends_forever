import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'package:friends_forever_flutter/src/serverpod_client.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          leading: CircularUserImage(
            userInfo: sessionManager.signedInUser,
            size: 42,
          ),
          title: Text(sessionManager.signedInUser!.userName!),
          subtitle: Text(sessionManager.signedInUser!.email ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              sessionManager.signOutDevice();
            },
            child: const Text('Sign out'),
          ),
        ),
      ],
    );
  }
}
