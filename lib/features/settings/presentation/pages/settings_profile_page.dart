import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../../shared/widgets/inputs/lucy_text_field.dart';
import '../../utils/settings_error_translator.dart';
import '../../utils/settings_full_name_parts.dart';
import '../controllers/settings_notifier.dart';
import '../widgets/settings_group.dart';
import '../widgets/settings_navigation_tile.dart';
import '../widgets/settings_profile_header.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_subpage_scaffold.dart';

/// Account identity: name, email, password (no AI config).
class SettingsProfilePage extends ConsumerStatefulWidget {
  const SettingsProfilePage({super.key});

  @override
  ConsumerState<SettingsProfilePage> createState() =>
      _SettingsProfilePageState();
}

class _SettingsProfilePageState extends ConsumerState<SettingsProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _firstName = '';
  String _lastName = '';

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final current = ref.read(settingsProvider);
      if (current.email.isEmpty && !current.isLoading) {
        await ref.read(settingsProvider.notifier).load();
      }
      if (!mounted) {
        return;
      }
      final parts = SettingsFullNameParts.split(
        ref.read(settingsProvider).fullName,
      );
      setState(() {
        _firstName = parts.firstName;
        _lastName = parts.lastName;
      });
    });
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    final fullName = SettingsFullNameParts.join(
      firstName: _firstName,
      lastName: _lastName,
    );
    final ok = await ref.read(settingsProvider.notifier).saveFullName(fullName);
    if (!mounted) {
      return;
    }
    if (ok) {
      LucySnackBar.showSuccess(
        context,
        message: context.l10n.settingsProfileSaved,
      );
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

  String? _validateFirstName(BuildContext context, String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return context.l10n.settingsFirstNameRequired;
    }
    if (trimmed.length < 2) {
      return context.l10n.settingsFieldMinTwoChars;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final state = ref.watch(settingsProvider);
    final displayName = state.fullName.trim().isNotEmpty
        ? state.fullName.trim()
        : state.email;

    if (state.isLoading && state.email.isEmpty) {
      return SettingsSubpageScaffold(
        title: l10n.settingsProfileTitle,
        body: Center(child: CircularProgressIndicator(color: scheme.primary)),
      );
    }

    return SettingsSubpageScaffold(
      title: l10n.settingsProfileTitle,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingsProfileHeader(
              displayName: displayName,
              email: state.email,
              isLoading: false,
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            LucyTextField(
              label: l10n.settingsFirstNameLabel,
              initialValue: _firstName,
              validator: (v) => _validateFirstName(context, v),
              onChanged: (v) => _firstName = v,
              isEnabled: !state.isSaving,
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            LucyTextField(
              label: l10n.settingsLastNameLabel,
              initialValue: _lastName,
              onChanged: (v) => _lastName = v,
              isEnabled: !state.isSaving,
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            Text(
              l10n.authEmailLabel,
              style: context.textTheme.labelLarge?.copyWith(
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLow / 2),
            Text(
              state.email,
              style: context.textTheme.bodyLarge?.copyWith(
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLow),
            Text(
              l10n.settingsEmailReadOnly,
              style: context.textTheme.bodySmall?.copyWith(
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
            LucyPrimaryButton(
              text: l10n.settingsSaveChanges,
              isLoading: state.isSaving,
              onPressed: state.isSaving ? null : _save,
              width: double.infinity,
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
            SettingsSectionHeader(title: l10n.settingsSecuritySection),
            SettingsGroup(
              children: [
                SettingsNavigationTile(
                  icon: Icons.lock_outline,
                  label: l10n.settingsChangePassword,
                  onTap: () =>
                      context.push(LucyRoutePaths.settingsChangePassword),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
