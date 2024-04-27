import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:settings/settings.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: NamedRoutes.initial,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: NamedRoutes.settings,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: NamedRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: NamedRoutes.register,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
