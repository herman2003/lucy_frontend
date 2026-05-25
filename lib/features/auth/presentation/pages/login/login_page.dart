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
import '../../controllers/login_notifier.dart';
import '../../widgets/auth_scaffold.dart';
import 'login_state.dart';

/// Email/password login page (T08).
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    return AuthScaffold(
      formKey: _formKey,
      brandingTitle: context.l10n.authLoginBrandingTitle,
      brandingSubtitle: context.l10n.authLoginBrandingSubtitle,
      formContent: _buildFormContent(context, loginState, loginNotifier),
    );
  }

  List<Widget> _buildFormContent(
    BuildContext context,
    LoginState loginState,
    LoginNotifier loginNotifier,
  ) {
    final scheme = context.colorScheme;
    final useMobileField = context.isMobile;

    return [
      Text(
        context.l10n.authLoginTitle,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),
      SizedBox(height: context.screenHeight * 0.02),
      if (loginState.errorMessage != null) ...[
        Text(
          loginState.errorMessage!,
          style: context.textTheme.bodyMedium?.copyWith(color: scheme.error),
        ),
        const SizedBox(height: LucyConstants.kSpacingLow),
      ],
      if (useMobileField)
        LucyTextFieldMobile(
          label: context.l10n.authEmailLabel,
          hintText: context.l10n.authEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) => Validators.validateEmail(context, value),
          onChanged: loginNotifier.updateEmail,
          isEnabled: !loginState.isLoading,
        )
      else
        LucyTextField(
          label: context.l10n.authEmailLabel,
          hintText: context.l10n.authEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) => Validators.validateEmail(context, value),
          onChanged: loginNotifier.updateEmail,
          isEnabled: !loginState.isLoading,
        ),
      if (useMobileField)
        LucyTextFieldMobile(
          label: context.l10n.authPasswordLabel,
          hintText: context.l10n.authPasswordHint,
          isPassword: true,
          textInputAction: TextInputAction.done,
          validator: (value) => Validators.validatePassword(context, value),
          onChanged: loginNotifier.updatePassword,
          isEnabled: !loginState.isLoading,
        )
      else
        LucyTextField(
          label: context.l10n.authPasswordLabel,
          hintText: context.l10n.authPasswordHint,
          isPassword: true,
          textInputAction: TextInputAction.done,
          validator: (value) => Validators.validatePassword(context, value),
          onChanged: loginNotifier.updatePassword,
          isEnabled: !loginState.isLoading,
        ),
      SizedBox(height: context.screenHeight * 0.02),
      Align(
        alignment: Alignment.centerRight,
        child: LucyTertiaryButton(
          text: context.l10n.authForgotPasswordLink,
          onPressed: loginState.isLoading
              ? null
              : () => context.go(LucyRoutePaths.resetPassword),
        ),
      ),
      SizedBox(height: context.screenHeight * 0.02),
      LucyPrimaryButton(
        text: context.l10n.authLoginButton,
        onPressed: () => _handleLogin(loginNotifier),
        isLoading: loginState.isLoading,
        width: double.infinity,
      ),
      SizedBox(height: context.screenHeight * 0.02),
      Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            context.l10n.authNoAccountPrompt,
            style: context.textTheme.bodyMedium?.copyWith(
              color: scheme.onSurface,
            ),
          ),
          LucyTertiaryButton(
            text: context.l10n.authSignUpLink,
            onPressed: loginState.isLoading
                ? null
                : () => context.go(LucyRoutePaths.signup),
          ),
        ],
      ),
    ];
  }

  Future<void> _handleLogin(LoginNotifier loginNotifier) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await loginNotifier.submitLogin(context);
  }
}
