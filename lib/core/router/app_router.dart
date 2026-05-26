import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/login/login_page.dart';
import '../../features/auth/presentation/pages/reset_password/reset_password_page.dart';
import '../../features/auth/presentation/pages/sign_up/sign_up_page.dart';
import '../../features/chat/presentation/pages/chat_page.dart';
import '../../features/documents/presentation/pages/documents_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_chat_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_confirm_page.dart';
import '../../features/quiz/presentation/pages/quiz_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../presentation/pages/splash_page.dart';
import '../shell/lucy_app_shell.dart';
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
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        name: LucyRouteNames.home,
        path: LucyRoutePaths.home,
        redirect: (context, state) => LucyRoutePaths.documents,
      ),
      GoRoute(
        name: LucyRouteNames.onboarding,
        path: LucyRoutePaths.onboarding,
        builder: (context, state) => const OnboardingChatPage(),
      ),
      GoRoute(
        name: LucyRouteNames.onboardingConfirm,
        path: LucyRoutePaths.onboardingConfirm,
        builder: (context, state) => const OnboardingConfirmPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return LucyAppShell(navigationShell: navigationShell, state: state);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: LucyRouteNames.documents,
                path: LucyRoutePaths.documents,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: DocumentsPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: LucyRouteNames.chat,
                path: LucyRoutePaths.chat,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ChatPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: LucyRouteNames.quiz,
                path: LucyRoutePaths.quiz,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: QuizPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: LucyRouteNames.settings,
                path: LucyRoutePaths.settings,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsPage()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
