import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../../../shared/widgets/inputs/lucy_text_field.dart';
import '../../utils/settings_auth_error_l10n.dart';
import '../controllers/change_password_notifier.dart';
import '../widgets/settings_subpage_scaffold.dart';

/// In-app password change (Firebase reauth).
class SettingsChangePasswordPage extends ConsumerStatefulWidget {
  const SettingsChangePasswordPage({super.key});

  @override
  ConsumerState<SettingsChangePasswordPage> createState() =>
      _SettingsChangePasswordPageState();
}

class _SettingsChangePasswordPageState
    extends ConsumerState<SettingsChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  String _currentPassword = '';
  String _newPassword = '';
  String _confirmPassword = '';

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    try {
      final ok = await ref
          .read(changePasswordProvider.notifier)
          .submit(
            currentPassword: _currentPassword,
            newPassword: _newPassword,
            confirmPassword: _confirmPassword,
          );
      if (!mounted) {
        return;
      }
      if (ok) {
        LucySnackBar.showSuccess(
          context,
          message: context.l10n.settingsPasswordChanged,
        );
        context.pop();
      }
    } catch (error) {
      if (!mounted) {
        return;
      }
      LucySnackBar.showError(
        context,
        message: SettingsAuthErrorL10n.fromException(context, error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final isLoading = ref.watch(changePasswordProvider);

    return SettingsSubpageScaffold(
      title: l10n.settingsChangePassword,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.settingsChangePasswordSubtitle,
              style: context.textTheme.bodyMedium?.copyWith(
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
            LucyTextField(
              label: l10n.settingsCurrentPassword,
              hintText: l10n.authPasswordHint,
              isPassword: true,
              validator: (v) => Validators.validatePassword(context, v),
              onChanged: (v) => _currentPassword = v,
              isEnabled: !isLoading,
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            LucyTextField(
              label: l10n.settingsNewPassword,
              hintText: l10n.authPasswordHint,
              isPassword: true,
              validator: (v) => Validators.validatePassword(context, v),
              onChanged: (v) => _newPassword = v,
              isEnabled: !isLoading,
            ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
            LucyTextField(
              label: l10n.settingsConfirmNewPassword,
              hintText: l10n.authPasswordHint,
              isPassword: true,
              validator: (v) {
                if (v != _newPassword) {
                  return l10n.settingsPasswordMismatch;
                }
                return Validators.validatePassword(context, v);
              },
              onChanged: (v) => _confirmPassword = v,
              isEnabled: !isLoading,
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
            LucyPrimaryButton(
              text: l10n.settingsSaveChanges,
              isLoading: isLoading,
              onPressed: isLoading ? null : _submit,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
