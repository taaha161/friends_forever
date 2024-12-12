import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friends_forever_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:friends_forever_flutter/features/auth/presentation/pages/register_page.dart';
import 'package:friends_forever_flutter/features/auth/presentation/pages/verify_email_page.dart';
import 'package:friends_forever_flutter/features/user/presentation/cubit/user_cubit.dart';
import 'package:go_router/go_router.dart';

class CustomRouter {
  static GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: LoginPage.route(),
          builder: (context, _) => LoginPage(),
        ),
        GoRoute(
          path: SignUpPage.route(),
          builder: (context, _) => SignUpPage(),
        ),
        GoRoute(
            path: EmailVerificationPage.route(),
            builder: (context, _) => EmailVerificationPage()),
      ],
      redirect: (context, state) {
        final userState = context.read<UserCubit>().state;
        final allowedRoutes = [
          LoginPage.route(),
          SignUpPage.route(),
          EmailVerificationPage.route(),
        ];
        if (!allowedRoutes.contains(state.matchedLocation) &&
            userState is UserInitial) {
          return LoginPage.route();
        }
        return null;
      });
}
