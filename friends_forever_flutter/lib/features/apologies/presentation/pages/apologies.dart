import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_forever_flutter/features/apologies/presentation/bloc/apology_bloc.dart';

class ApologiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apologies'),
      ),
      body: BlocBuilder<ApologyBloc, ApologyState>(
        builder: (context, state) {
          if (state is ApologyLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecievedApologiesLoaded) {
            return ListView.builder(
              itemCount: state.apologies.length,
              itemBuilder: (context, index) {
                final apology = state.apologies[index];
                return ListTile(
                  title: Text(apology.subject),
                  subtitle: Text(apology.message),
                );
              },
            );
          } else if (state is ApologyError) {
            return Center(child: Text('Failed to load apologies'));
          } else {
            return Center(child: Text('No apologies available'));
          }
        },
      ),
    );
  }
}
