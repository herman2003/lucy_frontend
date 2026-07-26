import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../quiz/domain/entities/learning_reminder_prefs.dart';
import '../controllers/learning_reminder_prefs_notifier.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_navigation_tile.dart';
import '../widgets/settings_subpage_scaffold.dart';
import '../widgets/settings_switch_tile.dart';

/// Learning reminder preferences — opt-in and daily time slot (LEARN-12a-3).
class SettingsRemindersPage extends ConsumerStatefulWidget {
  const SettingsRemindersPage({super.key});

  @override
  ConsumerState<SettingsRemindersPage> createState() =>
      _SettingsRemindersPageState();
}

class _SettingsRemindersPageState extends ConsumerState<SettingsRemindersPage> {
  String _formatReminderTime(
    BuildContext context,
    LearningReminderPrefs prefs,
  ) {
    return MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay(hour: prefs.reminderHour, minute: prefs.reminderMinute),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );
  }

  Future<void> _pickReminderTime(
    BuildContext context,
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
    await _runSave(
      () => ref
          .read(learningReminderPrefsProvider.notifier)
          .setReminderTime(hour: picked.hour, minute: picked.minute),
    );
  }

  Future<void> _runSave(Future<bool> Function() action) async {
    final ok = await action();
    if (!mounted || ok) {
      return;
    }
    LucySnackBar.showError(
      context,
      message: context.l10n.settingsRemindersSaveError,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final prefsAsync = ref.watch(learningReminderPrefsProvider);

    ref.listen(learningReminderPrefsProvider, (previous, next) {
      if (next.hasError && previous?.hasError != true && context.mounted) {
        LucySnackBar.showError(
          context,
          message: l10n.settingsRemindersLoadError,
        );
      }
    });

    if (prefsAsync.isLoading && !prefsAsync.hasValue) {
      return SettingsSubpageScaffold(
        title: l10n.settingsRemindersTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final prefs = prefsAsync.value ?? LearningReminderPrefs.defaults;

    return SettingsSubpageScaffold(
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
                onChanged: (value) => _runSave(
                  () => ref
                      .read(learningReminderPrefsProvider.notifier)
                      .setEnabled(value),
                ),
              ),
              if (prefs.enabled)
                SettingsNavigationTile(
                  icon: Icons.schedule_outlined,
                  label: l10n.settingsRemindersTimeLabel,
                  trailingText: _formatReminderTime(context, prefs),
                  onTap: () => _pickReminderTime(context, prefs),
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
                  onChanged: (value) => _runSave(
                    () => ref
                        .read(learningReminderPrefsProvider.notifier)
                        .setFlashcardsDue(value),
                  ),
                ),
                SettingsSwitchTile(
                  icon: Icons.calendar_month_outlined,
                  label: l10n.settingsRemindersRevisionPlanLabel,
                  value: prefs.revisionPlanEnabled,
                  onChanged: (value) => _runSave(
                    () => ref
                        .read(learningReminderPrefsProvider.notifier)
                        .setRevisionPlanEnabled(value),
                  ),
                ),
                SettingsSwitchTile(
                  icon: Icons.quiz_outlined,
                  label: l10n.settingsRemindersWeakQuizLabel,
                  value: prefs.weakQuizEnabled,
                  onChanged: (value) => _runSave(
                    () => ref
                        .read(learningReminderPrefsProvider.notifier)
                        .setWeakQuizEnabled(value),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
