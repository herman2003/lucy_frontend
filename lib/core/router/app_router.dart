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
import '../../features/quiz/presentation/pages/quiz_session_page.dart';
import '../../features/settings/presentation/pages/settings_ai_config_page.dart';
import '../../features/settings/presentation/pages/settings_change_password_page.dart';
import '../../features/settings/presentation/pages/settings_learner_domains_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/settings/presentation/pages/settings_profile_page.dart';
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
                pageBuilder: (context, state) => NoTransitionPage(
                  child: ChatPage(chatId: state.pathParameters['chatId']),
                ),
                routes: [
                  GoRoute(
                    name: LucyRouteNames.chatThread,
                    path: ':chatId',
                    pageBuilder: (context, state) => NoTransitionPage(
                      child: ChatPage(chatId: state.pathParameters['chatId']),
                    ),
                  ),
                ],
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
                routes: [
                  GoRoute(
                    name: LucyRouteNames.quizSession,
                    path: 'session/:sessionId',
                    builder: (context, state) => QuizSessionPage(
                      sessionId: state.pathParameters['sessionId']!,
                    ),
                  ),
                ],
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
                routes: [
                  GoRoute(
                    name: LucyRouteNames.settingsProfile,
                    path: 'profile',
                    builder: (context, state) => const SettingsProfilePage(),
                  ),
                  GoRoute(
                    name: LucyRouteNames.settingsAiConfig,
                    path: 'ai-config',
                    builder: (context, state) => const SettingsAiConfigPage(),
                  ),
                  GoRoute(
                    name: LucyRouteNames.settingsChangePassword,
                    path: 'change-password',
                    builder: (context, state) =>
                        const SettingsChangePasswordPage(),
                  ),
                  GoRoute(
                    name: LucyRouteNames.settingsLearnerDomains,
                    path: 'learner-profile/domains',
                    builder: (context, state) =>
                        const SettingsLearnerDomainsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
