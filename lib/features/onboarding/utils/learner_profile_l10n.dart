import '../../../core/localization/l10n/app_localizations.dart';
import '../domain/entities/learner_profile.dart';

/// Human-readable labels for [LearnerProfile] enum values (SPEC §4.4.1).
abstract final class LearnerProfileL10n {
  static String primaryRole(AppLocalizations l10n, String value) {
    return switch (value) {
      'student' => l10n.onboardingEnumPrimaryRoleStudent,
      'professional' => l10n.onboardingEnumPrimaryRoleProfessional,
      'educator' => l10n.onboardingEnumPrimaryRoleEducator,
      'self_learner' => l10n.onboardingEnumPrimaryRoleSelfLearner,
      'other' => l10n.onboardingEnumPrimaryRoleOther,
      _ => value,
    };
  }

  static String domain(AppLocalizations l10n, String value) {
    return switch (value) {
      'sciences' => l10n.onboardingEnumDomainSciences,
      'law' => l10n.onboardingEnumDomainLaw,
      'medicine' => l10n.onboardingEnumDomainMedicine,
      'languages' => l10n.onboardingEnumDomainLanguages,
      'business' => l10n.onboardingEnumDomainBusiness,
      'cs' => l10n.onboardingEnumDomainCs,
      'other' => l10n.onboardingEnumDomainOther,
      _ => value,
    };
  }

  static String learningGoal(AppLocalizations l10n, String value) {
    return switch (value) {
      'exam' => l10n.onboardingEnumLearningGoalExam,
      'understand_course' => l10n.onboardingEnumLearningGoalUnderstandCourse,
      'quick_review' => l10n.onboardingEnumLearningGoalQuickReview,
      'professional' => l10n.onboardingEnumLearningGoalProfessional,
      'certification' => l10n.onboardingEnumLearningGoalCertification,
      'other' => l10n.onboardingEnumLearningGoalOther,
      _ => value,
    };
  }

  static String selfAssessedLevel(AppLocalizations l10n, String value) {
    return switch (value) {
      'beginner' => l10n.onboardingEnumLevelBeginner,
      'intermediate' => l10n.onboardingEnumLevelIntermediate,
      'advanced' => l10n.onboardingEnumLevelAdvanced,
      'variable' => l10n.onboardingEnumLevelVariable,
      _ => value,
    };
  }

  static String explanationStyle(AppLocalizations l10n, String value) {
    return switch (value) {
      'step_by_step' => l10n.onboardingEnumStyleStepByStep,
      'summary_first' => l10n.onboardingEnumStyleSummaryFirst,
      'analogies' => l10n.onboardingEnumStyleAnalogies,
      'socratic' => l10n.onboardingEnumStyleSocratic,
      _ => value,
    };
  }

  static String feedbackTone(AppLocalizations l10n, String value) {
    return switch (value) {
      'encouraging' => l10n.onboardingEnumToneEncouraging,
      'neutral' => l10n.onboardingEnumToneNeutral,
      'strict' => l10n.onboardingEnumToneStrict,
      _ => value,
    };
  }

  static String tutoringLanguage(AppLocalizations l10n, String value) {
    return switch (value) {
      'fr' => l10n.onboardingEnumTutoringLangFr,
      'en' => l10n.onboardingEnumTutoringLangEn,
      'de' => l10n.onboardingEnumTutoringLangDe,
      'match_document' => l10n.onboardingEnumTutoringLangMatchDocument,
      _ => value,
    };
  }

  static String formatDomains(AppLocalizations l10n, List<String> domains) {
    return domains.map((d) => domain(l10n, d)).join(', ');
  }

  static List<({String label, String value})> profileRows(
    AppLocalizations l10n,
    LearnerProfile profile,
  ) {
    return [
      (
        label: l10n.onboardingProfileLabelPrimaryRole,
        value: primaryRole(l10n, profile.primaryRole),
      ),
      (
        label: l10n.onboardingProfileLabelMainDomains,
        value: formatDomains(l10n, profile.mainDomains),
      ),
      (
        label: l10n.onboardingProfileLabelLearningGoal,
        value: learningGoal(l10n, profile.learningGoal),
      ),
      (
        label: l10n.onboardingProfileLabelSelfAssessedLevel,
        value: selfAssessedLevel(l10n, profile.selfAssessedLevel),
      ),
      (
        label: l10n.onboardingProfileLabelExplanationStyle,
        value: explanationStyle(l10n, profile.explanationStyle),
      ),
      (
        label: l10n.onboardingProfileLabelFeedbackTone,
        value: feedbackTone(l10n, profile.feedbackTone),
      ),
      (
        label: l10n.onboardingProfileLabelTutoringLanguage,
        value: tutoringLanguage(l10n, profile.tutoringLanguage),
      ),
    ];
  }
}
