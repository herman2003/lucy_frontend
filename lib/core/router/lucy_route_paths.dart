/// Application route paths (SPEC §6.1).
class LucyRoutePaths {
  LucyRoutePaths._();

  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String resetPassword = '/reset-password';
  static const String home = '/home';
  static const String documents = '/documents';
  static const String chat = '/chat';
  static const String quiz = '/quiz';
  static const String settings = '/settings';
  static const String onboarding = '/onboarding';
  static const String onboardingConfirm = '/onboarding/confirm';

  /// Default post-onboarding destination (SPEC §2).
  static const String shellDefault = documents;

  static const Set<String> shellPaths = {
    documents,
    chat,
    quiz,
    settings,
  };

  static bool isShellPath(String location) => shellPaths.contains(location);
}
