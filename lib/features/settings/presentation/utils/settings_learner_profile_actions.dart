import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../onboarding/domain/entities/learner_profile.dart';
import '../../../onboarding/utils/learner_profile_field_options.dart';
import '../../../onboarding/utils/learner_profile_l10n.dart';
import '../../utils/settings_error_translator.dart';
import '../controllers/settings_notifier.dart';
import '../widgets/settings_single_choice_sheet.dart';

/// Opens enum editors and persists learner profile updates.
abstract final class SettingsLearnerProfileActions {
  static Future<void> pickPrimaryRole(
    BuildContext context,
    WidgetRef ref,
    LearnerProfile profile,
  ) {
    return _pickSingle(
      context: context,
      ref: ref,
      profile: profile,
      title: context.l10n.onboardingProfileLabelPrimaryRole,
      options: LearnerProfileFieldOptions.primaryRoles,
      current: profile.primaryRole,
      label: (l10n, value) => LearnerProfileL10n.primaryRole(l10n, value),
      apply: (p, value) => p.copyWith(primaryRole: value),
    );
  }

  static Future<void> pickLearningGoal(
    BuildContext context,
    WidgetRef ref,
    LearnerProfile profile,
  ) {
    return _pickSingle(
      context: context,
      ref: ref,
      profile: profile,
      title: context.l10n.onboardingProfileLabelLearningGoal,
      options: LearnerProfileFieldOptions.learningGoals,
      current: profile.learningGoal,
      label: (l10n, value) => LearnerProfileL10n.learningGoal(l10n, value),
      apply: (p, value) => p.copyWith(learningGoal: value),
    );
  }

  static Future<void> pickSelfAssessedLevel(
    BuildContext context,
    WidgetRef ref,
    LearnerProfile profile,
  ) {
    return _pickSingle(
      context: context,
      ref: ref,
      profile: profile,
      title: context.l10n.onboardingProfileLabelSelfAssessedLevel,
      options: LearnerProfileFieldOptions.selfAssessedLevels,
      current: profile.selfAssessedLevel,
      label: (l10n, value) => LearnerProfileL10n.selfAssessedLevel(l10n, value),
      apply: (p, value) => p.copyWith(selfAssessedLevel: value),
    );
  }

  static Future<void> pickExplanationStyle(
    BuildContext context,
    WidgetRef ref,
    LearnerProfile profile,
  ) {
    return _pickSingle(
      context: context,
      ref: ref,
      profile: profile,
      title: context.l10n.onboardingProfileLabelExplanationStyle,
      options: LearnerProfileFieldOptions.explanationStyles,
      current: profile.explanationStyle,
      label: (l10n, value) => LearnerProfileL10n.explanationStyle(l10n, value),
      apply: (p, value) => p.copyWith(explanationStyle: value),
    );
  }

  static Future<void> pickFeedbackTone(
    BuildContext context,
    WidgetRef ref,
    LearnerProfile profile,
  ) {
    return _pickSingle(
      context: context,
      ref: ref,
      profile: profile,
      title: context.l10n.onboardingProfileLabelFeedbackTone,
      options: LearnerProfileFieldOptions.feedbackTones,
      current: profile.feedbackTone,
      label: (l10n, value) => LearnerProfileL10n.feedbackTone(l10n, value),
      apply: (p, value) => p.copyWith(feedbackTone: value),
    );
  }

  static Future<void> pickTutoringLanguage(
    BuildContext context,
    WidgetRef ref,
    LearnerProfile profile,
  ) {
    return _pickSingle(
      context: context,
      ref: ref,
      profile: profile,
      title: context.l10n.onboardingProfileLabelTutoringLanguage,
      options: LearnerProfileFieldOptions.tutoringLanguages,
      current: profile.tutoringLanguage,
      label: (l10n, value) => LearnerProfileL10n.tutoringLanguage(l10n, value),
      apply: (p, value) => p.copyWith(tutoringLanguage: value),
    );
  }

  static void openDomainsEditor(BuildContext context) {
    context.push(LucyRoutePaths.settingsLearnerDomains);
  }

  static Future<void> _pickSingle({
    required BuildContext context,
    required WidgetRef ref,
    required LearnerProfile profile,
    required String title,
    required List<String> options,
    required String current,
    required String Function(AppLocalizations l10n, String value) label,
    required LearnerProfile Function(LearnerProfile profile, String value)
    apply,
  }) async {
    final l10n = context.l10n;
    await showSettingsSingleChoiceSheet(
      context: context,
      title: title,
      options: options,
      selectedValue: current,
      labelForValue: (value) => label(l10n, value),
      onSelected: (value) async {
        if (value == current) {
          return;
        }
        final ok = await ref
            .read(settingsProvider.notifier)
            .saveLearnerProfile(apply(profile, value));
        if (!context.mounted) {
          return;
        }
        if (ok) {
          LucySnackBar.showSuccess(context, message: l10n.settingsProfileSaved);
          return;
        }
        final code = ref.read(settingsProvider).saveErrorCode;
        if (code != null) {
          LucySnackBar.showError(
            context,
            message: SettingsErrorTranslator.translate(context, code),
          );
        }
      },
    );
  }
}
