import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/home/home_page.dart';
import '../../features/auth/presentation/pages/login/login_page.dart';
import '../../features/auth/presentation/pages/sign_up/sign_up_page.dart';
import '../presentation/pages/login_placeholder_page.dart';
import '../presentation/pages/splash_page.dart';
import 'lucy_route_names.dart';
import 'lucy_route_paths.dart';
import 'lucy_router_guards.dart';
import 'router_refresh_notifier.dart';

part 'app_router.g.dart';

/// Application [GoRouter] with auth bootstrap and session guard.
@Riverpod(keepAlive: true)
GoRouter lucyRouter(Ref ref) {
  final refresh = RouterRefreshNotifier(ref);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: LucyRoutePaths.splash,
    debugLogDiagnostics: true,
    refreshListenable: refresh,
    redirect: LucyRouterGuards.redirect,
    routes: [
      GoRoute(
        name: LucyRouteNames.splash,
        path: LucyRoutePaths.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: LucyRouteNames.login,
        path: LucyRoutePaths.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: LucyRouteNames.signup,
        path: LucyRoutePaths.signup,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        name: LucyRouteNames.resetPassword,
        path: LucyRoutePaths.resetPassword,
        builder: (context, state) => const LoginPlaceholderPage(),
      ),
      GoRoute(
        name: LucyRouteNames.home,
        path: LucyRoutePaths.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
