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

  static String get usersMe => '$baseUrl/v1/users/me';

  static String get onboardingProgress => '$baseUrl/v1/onboarding/progress';

  static String get documents => '$baseUrl/v1/documents';

  static String document(String id) => '$documents/$id';

  static String documentComplete(String id) => '${document(id)}/complete';

  static String documentUpload(String id) => '${document(id)}/upload';

  static String documentReprocess(String id) => '${document(id)}/reprocess';

  static String documentDownload(String id) => '${document(id)}/download';

  static String get chats => '$baseUrl/v1/chats';

  static String chat(String chatId) => '$chats/$chatId';

  static String chatMessages(String chatId) => '${chat(chatId)}/messages';

  static String chatMessagesStream(String chatId) =>
      '${chatMessages(chatId)}/stream';

  static String get chatEligibility => '$chats/eligibility';
}
