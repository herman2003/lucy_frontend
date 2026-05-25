/// Stable question identifiers (SPEC §4.5); aligned with backend catalogue.
abstract final class OnboardingQuestionIds {
  static const String qRole = 'q_role';
  static const String qDomains = 'q_domains';
  static const String qGoal = 'q_goal';
  static const String qLevel = 'q_level';
  static const String qStyle = 'q_style';
  static const String qTone = 'q_tone';
  static const String qLanguage = 'q_language';

  static const List<String> ordered = [
    qRole,
    qDomains,
    qGoal,
    qLevel,
    qStyle,
    qTone,
    qLanguage,
  ];

  static const int stepCount = 7;
}
