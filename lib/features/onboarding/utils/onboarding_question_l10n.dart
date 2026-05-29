import 'package:lucy_frontend/core/localization/l10n/app_localizations.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';

/// Resolves the official UI label for a [questionId] (SPEC §4.13 R7).
String onboardingQuestionText(AppLocalizations l10n, String questionId) {
  switch (questionId) {
    case OnboardingQuestionIds.qRole:
      return l10n.onboardingQuestionQRole;
    case OnboardingQuestionIds.qDomains:
      return l10n.onboardingQuestionQDomains;
    case OnboardingQuestionIds.qGoal:
      return l10n.onboardingQuestionQGoal;
    case OnboardingQuestionIds.qLevel:
      return l10n.onboardingQuestionQLevel;
    case OnboardingQuestionIds.qStyle:
      return l10n.onboardingQuestionQStyle;
    case OnboardingQuestionIds.qTone:
      return l10n.onboardingQuestionQTone;
    case OnboardingQuestionIds.qLanguage:
      return l10n.onboardingQuestionQLanguage;
    default:
      throw ArgumentError.value(questionId, 'questionId', 'Unknown onboarding question');
  }
}
