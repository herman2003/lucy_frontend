import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../quiz/domain/entities/learning_reminder_prefs.dart';
import '../controllers/learning_reminder_prefs_notifier.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_navigation_tile.dart';
import '../widgets/settings_subpage_scaffold.dart';
import '../widgets/settings_switch_tile.dart';

/// Learning reminder preferences — opt-in and daily time slot (LEARN-12a-3).
class SettingsRemindersPage extends ConsumerWidget {
  const SettingsRemindersPage({super.key});

  String _formatReminderTime(BuildContext context, LearningReminderPrefs prefs) {
    return MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay(hour: prefs.reminderHour, minute: prefs.reminderMinute),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );
  }

  Future<void> _pickReminderTime(
    BuildContext context,
    WidgetRef ref,
    LearningReminderPrefs prefs,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: prefs.reminderHour,
        minute: prefs.reminderMinute,
      ),
    );
    if (picked == null) {
      return;
    }
    await ref
        .read(learningReminderPrefsProvider.notifier)
        .setReminderTime(hour: picked.hour, minute: picked.minute);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final prefsAsync = ref.watch(learningReminderPrefsProvider);

    return prefsAsync.when(
      loading: () => SettingsSubpageScaffold(
        title: l10n.settingsRemindersTitle,
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (_, _) => SettingsSubpageScaffold(
        title: l10n.settingsRemindersTitle,
        body: Center(child: Text(l10n.settingsRemindersLoadError)),
      ),
      data: (prefs) => SettingsSubpageScaffold(
        title: l10n.settingsRemindersTitle,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.settingsRemindersIntro,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: LucySpacing.spaceXl),
            SettingsGroup(
              children: [
                SettingsSwitchTile(
                  icon: Icons.notifications_active_outlined,
                  label: l10n.settingsRemindersEnabledLabel,
                  subtitle: l10n.settingsRemindersEnabledSubtitle,
                  value: prefs.enabled,
                  onChanged: (value) => ref
                      .read(learningReminderPrefsProvider.notifier)
                      .setEnabled(value),
                ),
                if (prefs.enabled)
                  SettingsNavigationTile(
                    icon: Icons.schedule_outlined,
                    label: l10n.settingsRemindersTimeLabel,
                    trailingText: _formatReminderTime(context, prefs),
                    onTap: () => _pickReminderTime(context, ref, prefs),
                  ),
              ],
            ),
            if (prefs.enabled) ...[
              const SizedBox(height: LucySpacing.spaceXl),
              SettingsGroup(
                children: [
                  SettingsSwitchTile(
                    icon: Icons.style_outlined,
                    label: l10n.settingsRemindersFlashcardsLabel,
                    value: prefs.flashcardsDue,
                    onChanged: (value) => ref
                        .read(learningReminderPrefsProvider.notifier)
                        .setFlashcardsDue(value),
                  ),
                  SettingsSwitchTile(
                    icon: Icons.calendar_month_outlined,
                    label: l10n.settingsRemindersRevisionPlanLabel,
                    value: prefs.revisionPlanEnabled,
                    onChanged: (value) => ref
                        .read(learningReminderPrefsProvider.notifier)
                        .setRevisionPlanEnabled(value),
                  ),
                  SettingsSwitchTile(
                    icon: Icons.quiz_outlined,
                    label: l10n.settingsRemindersWeakQuizLabel,
                    value: prefs.weakQuizEnabled,
                    onChanged: (value) => ref
                        .read(learningReminderPrefsProvider.notifier)
                        .setWeakQuizEnabled(value),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
