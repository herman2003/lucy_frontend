import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/lucy_constants.dart';
import '../../../../../core/extensions/build_context_responsive.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/router/lucy_route_paths.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../../shared/widgets/buttons/lucy_tertiary_button.dart';
import '../../../../../shared/widgets/inputs/lucy_text_field.dart';
import '../../../../../shared/widgets/inputs/lucy_text_field_mobile.dart';
import '../../controllers/sign_up_notifier.dart';
import '../../widgets/auth_scaffold.dart';
import 'sign_up_state.dart';

/// Email/password sign up page (T09).
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    final signUpNotifier = ref.read(signUpProvider.notifier);

    return AuthScaffold(
      formKey: _formKey,
      brandingTitle: context.l10n.authSignUpBrandingTitle,
      brandingSubtitle: context.l10n.authSignUpBrandingSubtitle,
      formContent: _buildFormContent(context, signUpState, signUpNotifier),
    );
  }

  List<Widget> _buildFormContent(
    BuildContext context,
    SignUpState signUpState,
    SignUpNotifier signUpNotifier,
  ) {
    final scheme = context.colorScheme;
    final useMobileField = context.isMobile;

    Widget nameField() {
      final common = (
        label: context.l10n.authFullNameLabel,
        hint: context.l10n.authFullNameHint,
        validator: (String? value) => Validators.validateFullName(context, value),
        onChanged: signUpNotifier.updateFullName,
        enabled: !signUpState.isLoading,
      );
      if (useMobileField) {
        return LucyTextFieldMobile(
          label: common.label,
          hintText: common.hint,
          textInputAction: TextInputAction.next,
          validator: common.validator,
          onChanged: common.onChanged,
          isEnabled: common.enabled,
        );
      }
      return LucyTextField(
        label: common.label,
        hintText: common.hint,
        textInputAction: TextInputAction.next,
        validator: common.validator,
        onChanged: common.onChanged,
        isEnabled: common.enabled,
      );
    }

    Widget emailField() {
      if (useMobileField) {
        return LucyTextFieldMobile(
          label: context.l10n.authEmailLabel,
          hintText: context.l10n.authEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) => Validators.validateEmail(context, value),
          onChanged: signUpNotifier.updateEmail,
          isEnabled: !signUpState.isLoading,
        );
      }
      return LucyTextField(
        label: context.l10n.authEmailLabel,
        hintText: context.l10n.authEmailHint,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        validator: (value) => Validators.validateEmail(context, value),
        onChanged: signUpNotifier.updateEmail,
        isEnabled: !signUpState.isLoading,
      );
    }

    Widget passwordField() {
      if (useMobileField) {
        return LucyTextFieldMobile(
          label: context.l10n.authPasswordLabel,
          hintText: context.l10n.authPasswordHint,
          isPassword: true,
          textInputAction: TextInputAction.done,
          validator: (value) => Validators.validatePassword(context, value),
          onChanged: signUpNotifier.updatePassword,
          isEnabled: !signUpState.isLoading,
        );
      }
      return LucyTextField(
        label: context.l10n.authPasswordLabel,
        hintText: context.l10n.authPasswordHint,
        isPassword: true,
        textInputAction: TextInputAction.done,
        validator: (value) => Validators.validatePassword(context, value),
        onChanged: signUpNotifier.updatePassword,
        isEnabled: !signUpState.isLoading,
      );
    }

    return [
      Text(
        context.l10n.authSignUpTitle,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),
      SizedBox(height: context.screenHeight * 0.02),
      nameField(),
      SizedBox(height: LucyConstants.kSpacingLow),

      emailField(),
      SizedBox(height: LucyConstants.kSpacingLow),

      passwordField(),
      SizedBox(height: context.screenHeight * 0.02),
      LucyPrimaryButton(
        text: context.l10n.authSignUpButton,
        onPressed: () => _handleSignUp(signUpNotifier),
        isLoading: signUpState.isLoading,
        width: double.infinity,
      ),
      SizedBox(height: context.screenHeight * 0.02),
      Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            context.l10n.authAlreadyHaveAccountPrompt,
            style: context.textTheme.bodyMedium?.copyWith(
              color: scheme.onSurface,
            ),
          ),
          SizedBox(width: LucyConstants.kSpacingLow),

          LucyTertiaryButton(
            text: context.l10n.authLoginLink,
            onPressed: signUpState.isLoading
                ? null
                : () => context.go(LucyRoutePaths.login),
          ),
        ],
      ),
    ];
  }

  Future<void> _handleSignUp(SignUpNotifier signUpNotifier) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await signUpNotifier.submitSignUp(context);
  }
}
