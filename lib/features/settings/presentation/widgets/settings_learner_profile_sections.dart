import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context.dart';
import '../../../onboarding/domain/entities/learner_profile.dart';
import '../../../onboarding/utils/learner_profile_l10n.dart';
import '../utils/settings_learner_profile_actions.dart';
import 'settings_group.dart';
import 'settings_navigation_tile.dart';
import 'settings_section_header.dart';

/// Learner profile rows grouped by theme (editable).
class SettingsLearnerProfileSections extends ConsumerWidget {
  const SettingsLearnerProfileSections({super.key, required this.profile});

  final LearnerProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsSectionHeader(title: l10n.settingsThemeSituation),
        SettingsGroup(
          children: [
            SettingsNavigationTile(
              icon: Icons.person_outline,
              label: l10n.onboardingProfileLabelPrimaryRole,
              trailingText: LearnerProfileL10n.primaryRole(
                l10n,
                profile.primaryRole,
              ),
              onTap: () => SettingsLearnerProfileActions.pickPrimaryRole(
                context,
                ref,
                profile,
              ),
            ),
            SettingsNavigationTile(
              icon: Icons.menu_book_outlined,
              label: l10n.onboardingProfileLabelMainDomains,
              trailingText: LearnerProfileL10n.formatDomains(
                l10n,
                profile.mainDomains,
              ),
              onTap: () =>
                  SettingsLearnerProfileActions.openDomainsEditor(context),
            ),
          ],
        ),
        SettingsSectionHeader(title: l10n.settingsThemeGoals),
        SettingsGroup(
          children: [
            SettingsNavigationTile(
              icon: Icons.flag_outlined,
              label: l10n.onboardingProfileLabelLearningGoal,
              trailingText: LearnerProfileL10n.learningGoal(
                l10n,
                profile.learningGoal,
              ),
              onTap: () => SettingsLearnerProfileActions.pickLearningGoal(
                context,
                ref,
                profile,
              ),
            ),
            SettingsNavigationTile(
              icon: Icons.trending_up,
              label: l10n.onboardingProfileLabelSelfAssessedLevel,
              trailingText: LearnerProfileL10n.selfAssessedLevel(
                l10n,
                profile.selfAssessedLevel,
              ),
              onTap: () => SettingsLearnerProfileActions.pickSelfAssessedLevel(
                context,
                ref,
                profile,
              ),
            ),
          ],
        ),
        SettingsSectionHeader(title: l10n.settingsThemeLucyStyle),
        SettingsGroup(
          children: [
            SettingsNavigationTile(
              icon: Icons.psychology_outlined,
              label: l10n.onboardingProfileLabelExplanationStyle,
              trailingText: LearnerProfileL10n.explanationStyle(
                l10n,
                profile.explanationStyle,
              ),
              onTap: () => SettingsLearnerProfileActions.pickExplanationStyle(
                context,
                ref,
                profile,
              ),
            ),
            SettingsNavigationTile(
              icon: Icons.record_voice_over_outlined,
              label: l10n.onboardingProfileLabelFeedbackTone,
              trailingText: LearnerProfileL10n.feedbackTone(
                l10n,
                profile.feedbackTone,
              ),
              onTap: () => SettingsLearnerProfileActions.pickFeedbackTone(
                context,
                ref,
                profile,
              ),
            ),
            SettingsNavigationTile(
              icon: Icons.translate,
              label: l10n.onboardingProfileLabelTutoringLanguage,
              trailingText: LearnerProfileL10n.tutoringLanguage(
                l10n,
                profile.tutoringLanguage,
              ),
              onTap: () => SettingsLearnerProfileActions.pickTutoringLanguage(
                context,
                ref,
                profile,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
