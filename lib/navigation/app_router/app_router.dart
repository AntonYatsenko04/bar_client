import 'package:bar_client/features/auth/ui/sign_in/sign_in_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const SignInScreen(),
    ),
  ],
);
