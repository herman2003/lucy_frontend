import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/lucy_constants.dart';
import '../../../../../core/extensions/build_context_responsive.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/router/lucy_route_paths.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../../../../../shared/widgets/buttons/lucy_tertiary_button.dart';
import '../../../../../shared/widgets/inputs/lucy_text_field.dart';
import '../../../../../shared/widgets/inputs/lucy_text_field_mobile.dart';
import '../../controllers/reset_password_notifier.dart';
import '../../widgets/auth_scaffold.dart';
import 'reset_password_state.dart';

/// Password reset email request page (T10).
class ResetPasswordPage extends ConsumerStatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final resetState = ref.watch(resetPasswordProvider);
    final resetNotifier = ref.read(resetPasswordProvider.notifier);

    return AuthScaffold(
      formKey: _formKey,
      brandingTitle: context.l10n.authResetBrandingTitle,
      brandingSubtitle: context.l10n.authResetBrandingSubtitle,
      formContent: resetState.view == ResetPasswordView.success
          ? _buildSuccessContent(context, resetState, resetNotifier)
          : _buildFormContent(context, resetState, resetNotifier),
    );
  }

  List<Widget> _buildFormContent(
    BuildContext context,
    ResetPasswordState resetState,
    ResetPasswordNotifier resetNotifier,
  ) {
    final scheme = context.colorScheme;
    final useMobileField = context.isMobile;

    final emailField = useMobileField
        ? LucyTextFieldMobile(
            label: context.l10n.authEmailLabel,
            hintText: context.l10n.authEmailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            validator: (value) => Validators.validateEmail(context, value),
            onChanged: resetNotifier.updateEmail,
            isEnabled: !resetState.isLoading,
          )
        : LucyTextField(
            label: context.l10n.authEmailLabel,
            hintText: context.l10n.authEmailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            validator: (value) => Validators.validateEmail(context, value),
            onChanged: resetNotifier.updateEmail,
            isEnabled: !resetState.isLoading,
          );

    return [
      Text(
        context.l10n.authResetTitle,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),
      SizedBox(height: context.screenHeight * 0.01),
      Text(
        context.l10n.authResetSubtitle,
        style: context.textTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),
      SizedBox(height: context.screenHeight * 0.02),
      emailField,
      SizedBox(height: context.screenHeight * 0.02),
      LucyPrimaryButton(
        text: context.l10n.authResetButton,
        onPressed: () => _handleSubmit(resetNotifier),
        isLoading: resetState.isLoading,
        width: double.infinity,
      ),
      SizedBox(height: context.screenHeight * 0.02),
      Center(
        child: LucyTertiaryButton(
          text: context.l10n.authResetBackToLogin,
          onPressed: resetState.isLoading
              ? null
              : () => context.go(LucyRoutePaths.login),
        ),
      ),
    ];
  }

  List<Widget> _buildSuccessContent(
    BuildContext context,
    ResetPasswordState resetState,
    ResetPasswordNotifier resetNotifier,
  ) {
    final scheme = context.colorScheme;
    final email = resetState.submittedEmail ?? '';

    return [
      Icon(
        Icons.mark_email_read_outlined,
        size: 48,
        color: scheme.primary,
      ),
      const SizedBox(height: LucyConstants.kSpacingMedium),
      Text(
        context.l10n.authResetSuccessTitle,
        textAlign: TextAlign.center,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),
      SizedBox(height: context.screenHeight * 0.02),
      Text(
        context.l10n.authResetSuccessMessage(email),
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium?.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),
      SizedBox(height: context.screenHeight * 0.03),
      LucySecondaryButton(
        text: context.l10n.authResetTryAgain,
        onPressed: resetNotifier.tryAgain,
        width: double.infinity,
      ),
      const SizedBox(height: LucyConstants.kSpacingMedium),
      LucyTertiaryButton(
        text: context.l10n.authResetBackToLogin,
        onPressed: () => context.go(LucyRoutePaths.login),
      ),
    ];
  }

  Future<void> _handleSubmit(ResetPasswordNotifier resetNotifier) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await resetNotifier.submitReset(context);
  }
}
