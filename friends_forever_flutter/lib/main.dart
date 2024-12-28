import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_forever_flutter/core/router/router.dart';
import 'package:friends_forever_flutter/dependencies.dart';
import 'package:friends_forever_flutter/features/apologies/presentation/bloc/apology_bloc.dart';
import 'package:friends_forever_flutter/features/friends/presentation/bloc/friends_bloc.dart';
import 'package:friends_forever_flutter/features/user/presentation/cubit/user_cubit.dart';

import 'features/auth/presentation/bloc/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => serviceLocator<UserCubit>()),
    BlocProvider(
      create: (_) => serviceLocator<AuthBloc>()..add(AuthCheckUserEvent()),
    ),
    BlocProvider(create: (_) => serviceLocator<ApologyBloc>()),
    BlocProvider(create: (_) => serviceLocator<FriendsBloc>())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        CustomRouter.router.refresh();
      },
      child: MaterialApp.router(
        title: "Friends Forever",
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: CustomRouter.router,
      ),
    );
  }
}
