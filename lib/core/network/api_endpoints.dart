/// Backend API paths (SPEC §4.6). No URLs in feature code.
abstract final class ApiEndpoints {
  /// Override via `--dart-define=LUCY_API_BASE_URL=...` for staging/prod.
  static const String baseUrl = String.fromEnvironment(
    'LUCY_API_BASE_URL',
    defaultValue: 'http://localhost:3000',
  );

  static String get onboardingValidateAnswer =>
      '$baseUrl/v1/onboarding/validate-answer';

  static String get onboardingConfirmTurn =>
      '$baseUrl/v1/onboarding/confirm-turn';

  static String get onboardingAnalyze => '$baseUrl/v1/onboarding/analyze';

  static String get onboardingFinalize => '$baseUrl/v1/onboarding/finalize';
}
