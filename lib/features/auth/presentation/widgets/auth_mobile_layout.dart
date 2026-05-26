import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/theme/lucy_flex_theme.dart';
import '../../../../shared/widgets/branding/auth_twinkling_stars_background.dart';
import '../../../../shared/widgets/containers/lucy_form_container.dart';

/// Full-screen gradient auth layout for mobile.
class AuthMobileLayout extends StatelessWidget {
  const AuthMobileLayout({super.key, required this.formContent, this.formKey});

  final List<Widget> formContent;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LucyFlexTheme.authBrandingGradient(context),
      ),
      child: AuthTwinklingStarsBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: LucyConstants.kSpacingMedium,
                vertical: LucyConstants.kSpacingLarge,
              ),
              child: LucyFormContainer(formKey: formKey, children: formContent),
            ),
          ),
        ),
      ),
    );
  }
}
