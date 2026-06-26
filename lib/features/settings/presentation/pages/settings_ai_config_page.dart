import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../controllers/settings_notifier.dart';
import '../widgets/settings_learner_profile_sections.dart';
import '../widgets/settings_subpage_scaffold.dart';

/// Lucy AI / learner preferences (separate from account profile).
class SettingsAiConfigPage extends ConsumerStatefulWidget {
  const SettingsAiConfigPage({super.key});

  @override
  ConsumerState<SettingsAiConfigPage> createState() =>
      _SettingsAiConfigPageState();
}

class _SettingsAiConfigPageState extends ConsumerState<SettingsAiConfigPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final current = ref.read(settingsProvider);
      if (current.email.isEmpty && !current.isLoading) {
        ref.read(settingsProvider.notifier).load();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = ref.watch(settingsProvider);
    final profile = state.learnerProfile;

    if (state.isLoading && profile == null && state.email.isEmpty) {
      return SettingsSubpageScaffold(
        title: l10n.settingsAiConfigTitle,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return SettingsSubpageScaffold(
      title: l10n.settingsAiConfigTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.settingsAiConfigIntro,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: LucySpacing.spaceXl),
          if (profile != null)
            SettingsLearnerProfileSections(profile: profile)
          else if (!state.isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LucySpacing.spaceLg,
              ),
              child: Text(
                l10n.settingsLearnerProfileUnavailable,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
