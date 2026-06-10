import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../onboarding/domain/entities/learner_profile.dart';
import '../../../onboarding/utils/learner_profile_field_options.dart';
import '../../../onboarding/utils/learner_profile_l10n.dart';
import '../../utils/settings_error_translator.dart';
import '../controllers/settings_notifier.dart';
import '../widgets/settings_subpage_scaffold.dart';

/// Multi-select editor for learner profile domains.
class SettingsLearnerDomainsPage extends ConsumerStatefulWidget {
  const SettingsLearnerDomainsPage({super.key});

  @override
  ConsumerState<SettingsLearnerDomainsPage> createState() =>
      _SettingsLearnerDomainsPageState();
}

class _SettingsLearnerDomainsPageState
    extends ConsumerState<SettingsLearnerDomainsPage> {
  Set<String> _selected = {};
  bool _initialized = false;

  void _ensureInitialized(LearnerProfile? profile) {
    if (_initialized || profile == null) {
      return;
    }
    _selected = profile.mainDomains.toSet();
    _initialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final state = ref.watch(settingsProvider);
    final profile = state.learnerProfile;
    _ensureInitialized(profile);

    if (profile == null) {
      return SettingsSubpageScaffold(
        title: l10n.onboardingProfileLabelMainDomains,
        body: Center(child: Text(l10n.settingsLearnerProfileUnavailable)),
      );
    }

    return SettingsSubpageScaffold(
      title: l10n.onboardingProfileLabelMainDomains,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.settingsLearnerDomainsHint,
            style: context.textTheme.bodyMedium?.copyWith(
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: LucyConstants.kSpacingMedium),
          Wrap(
            spacing: LucyConstants.kSpacingLow,
            runSpacing: LucyConstants.kSpacingLow,
            children: [
              for (final domain in LearnerProfileFieldOptions.mainDomains)
                FilterChip(
                  label: Text(
                    LearnerProfileL10n.domain(l10n, domain),
                    style: TextStyle(
                      color: _selected.contains(domain)
                          ? scheme.surface
                          : scheme.primary,
                    ),
                  ),
                  selected: _selected.contains(domain),
                  selectedColor: scheme.primary,
                  backgroundColor: scheme.surface,
                  checkmarkColor: scheme.surface,
                  side: BorderSide(color: scheme.primary),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selected.add(domain);
                      } else {
                        _selected.remove(domain);
                      }
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: LucyConstants.kSpacingLarge),
          LucyPrimaryButton(
            text: l10n.settingsSaveChanges,
            isLoading: state.isSaving,
            onPressed: state.isSaving || _selected.isEmpty
                ? null
                : () => _save(context, profile),
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Future<void> _save(BuildContext context, LearnerProfile profile) async {
    final updated = profile.copyWith(mainDomains: _selected.toList());
    final ok = await ref
        .read(settingsProvider.notifier)
        .saveLearnerProfile(updated);
    if (!context.mounted) {
      return;
    }
    if (ok) {
      LucySnackBar.showSuccess(
        context,
        message: context.l10n.settingsProfileSaved,
      );
      Navigator.of(context).pop();
      return;
    }
    final code = ref.read(settingsProvider).saveErrorCode;
    if (code != null) {
      LucySnackBar.showError(
        context,
        message: SettingsErrorTranslator.translate(context, code),
      );
    }
  }
}
