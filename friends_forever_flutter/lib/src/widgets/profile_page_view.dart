import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friends_forever_client/friends_forever_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'package:friends_forever_flutter/src/serverpod_client.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: client.user.get(page: 1),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                leading: CircularUserImage(
                  userInfo: sessionManager.signedInUser,
                  size: 42,
                ),
                title: snapshot.data == null
                    ? Text("User not found")
                    : Text(snapshot.data!.userInfo!.userIdentifier),
                subtitle: Text(snapshot.data!.userInfo!.email ?? ""),
                trailing: Text(
                    'Invite Code: ${snapshot.data!.inviteCode!.code} \n ${snapshot.data!.friends!.length}'),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () async {
                    final message = await client.user.addFriend("efeKH");
                    log(message['message']!);
                  },
                  child: const Text('Add a friend'),
                ),
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
        });
  }
}
