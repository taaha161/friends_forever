import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_forever_flutter/core/router/router.dart';
import 'package:friends_forever_flutter/features/apologies/data/models/apology_model.dart';
import 'package:friends_forever_flutter/features/apologies/presentation/bloc/apology_bloc.dart';
import 'package:friends_forever_flutter/features/user/data/models/user_model.dart';

class ApologiesPage extends StatefulWidget {
  const ApologiesPage({super.key});

  static String route() => '/apologies';

  @override
  State<ApologiesPage> createState() => _ApologiesPageState();
}

class _ApologiesPageState extends State<ApologiesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<ApologyBloc>(context).add(GetSentApologies());
    BlocProvider.of<ApologyBloc>(context).add(GetRecievedApologies());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              final subjectController = TextEditingController();
              final messageController = TextEditingController();
              return AlertDialog(
                title: Text('Send Apology'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: subjectController,
                      decoration: InputDecoration(hintText: 'Subject'),
                    ),
                    TextField(
                      controller: messageController,
                      decoration: InputDecoration(hintText: 'Message'),
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
                      final apology = ApologyModel(
                          id: 1,
                          subject: subjectController.text,
                          message: messageController.text,
                          sender: UserModel(
                              id: 3,
                              username: 'user1',
                              email: '',
                              inviteCode: ''),
                          reciever: UserModel(
                              id: 2,
                              username: 'user2',
                              email: '',
                              inviteCode: ''));
                      context.read<ApologyBloc>().add(SendApology(apology));
                      Navigator.pop(context);
                    },
                    child: Text('Send'),
                  ),
                ],
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text('Apologies'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Sent'),
            Tab(text: 'Received'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BlocBuilder<ApologyBloc, ApologyState>(
            builder: (context, state) {
              if (state is ApologyLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ApologiesLoaded) {
                return ListView.builder(
                  itemCount: state.sentApologies.length,
                  itemBuilder: (context, index) {
                    final apology = state.sentApologies[index];
                    return ListTile(
                      trailing: Text("Sent to: ${apology.sender.username}"),
                      title: Text(apology.subject,
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text(apology.message),
                    );
                  },
                );
              } else if (state is ApologyError) {
                log(state.message);
                return Center(child: Text('Failed to load sent apologies'));
              } else {
                log(state.toString());
                return Center(child: Text('No sent apologies available'));
              }
            },
          ),
          BlocBuilder<ApologyBloc, ApologyState>(
            builder: (context, state) {
              if (state is ApologyLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ApologiesLoaded) {
                return ListView.builder(
                  itemCount: state.recievedApologies.length,
                  itemBuilder: (context, index) {
                    final apology = state.recievedApologies[index];
                    return ListTile(
                      trailing:
                          Text("Received from: ${apology.sender.username}"),
                      title: Text(apology.subject,
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text(apology.message),
                    );
                  },
                );
              } else if (state is ApologyError) {
                log(state.message);
                return Center(child: Text('Failed to load received apologies'));
              } else {
                return Center(child: Text('No received apologies available'));
              }
            },
          ),
        ],
      ),
    );
  }
}
