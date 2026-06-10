import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../utils/settings_error_translator.dart';
import '../../utils/settings_ui_locale_l10n.dart';
import '../controllers/settings_notifier.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_language_sheet.dart';
import '../widgets/settings_learner_profile_sections.dart';
import '../widgets/settings_navigation_tile.dart';
import '../widgets/settings_section_header.dart';
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
    Future.microtask(() => ref.read(settingsProvider.notifier).load());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final state = ref.watch(settingsProvider);
    final profile = state.learnerProfile;

    if (state.isLoading && profile == null && state.email.isEmpty) {
      return SettingsSubpageScaffold(
        title: l10n.settingsAiConfigTitle,
        body: Center(child: CircularProgressIndicator(color: scheme.primary)),
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
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: LucyConstants.kSpacingLarge),
          if (profile != null)
            SettingsLearnerProfileSections(profile: profile)
          else if (!state.isLoading)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LucyConstants.kContainerPaddingMedium,
              ),
              child: Text(
                l10n.settingsLearnerProfileUnavailable,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: scheme.primary,
                ),
              ),
            ),
          SettingsSectionHeader(title: l10n.settingsSectionApplication),
          SettingsGroup(
            children: [
              SettingsNavigationTile(
                icon: Icons.language,
                label: l10n.settingsUiLocaleLabel,
                trailingText: SettingsUiLocaleL10n.label(l10n, state.uiLocale),
                onTap: () => _pickLanguage(context, state.uiLocale),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickLanguage(BuildContext context, String? current) async {
    await showSettingsLanguageSheet(
      context: context,
      currentCode: current,
      onSelected: (code) async {
        if (code == current) {
          return;
        }
        final ok = await ref.read(settingsProvider.notifier).saveUiLocale(code);
        if (!context.mounted) {
          return;
        }
        if (ok) {
          LucySnackBar.showSuccess(
            context,
            message: context.l10n.settingsProfileSaved,
          );
          return;
        }
        final errorCode = ref.read(settingsProvider).saveErrorCode;
        if (errorCode != null) {
          LucySnackBar.showError(
            context,
            message: SettingsErrorTranslator.translate(context, errorCode),
          );
        }
      },
    );
  }
}
