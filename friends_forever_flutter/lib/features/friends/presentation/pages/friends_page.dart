import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_forever_flutter/features/friends/presentation/bloc/friends_bloc.dart';

class FriendsPage extends StatefulWidget {
  static String route() => '/friends';
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FriendsBloc>(context).add(LoadFriendsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final inviteCodeController = TextEditingController();

              return AlertDialog(
                title: Text('Add Friend'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: inviteCodeController,
                      decoration: InputDecoration(hintText: 'Invite Code'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<FriendsBloc>()
                          .add(FriendAddedEvent(inviteCodeController.text));
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text('Friends List'),
      ),
      body: BlocBuilder<FriendsBloc, FriendsState>(
        builder: (context, state) {
          if (state is FriendsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FriendsLoaded) {
            final friends = state.friends;
            return ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(friends[index].username),
                  subtitle: Text(friends[index].id.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<FriendsBloc>()
                            .add(FriendRemovedEvent(friends[index]));
                      },
                      icon: Icon(Icons.delete)),
                );
              },
            );
          } else if (state is FriendsError) {
            log(state.message);
            return Center(child: Text('Failed to load friends'));
          } else {
            return Center(child: Text('No friends found'));
          }
        },
      ),
    );
  }
}
