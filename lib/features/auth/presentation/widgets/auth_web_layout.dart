import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_flex_theme.dart';
import '../../../../shared/widgets/branding/auth_twinkling_stars_background.dart';
import '../../../../shared/widgets/branding/lucy_logo.dart';
import '../../../../shared/widgets/containers/lucy_form_container.dart';

/// Two-column auth layout for desktop/web (~448px form card).
class AuthWebLayout extends StatelessWidget {
  const AuthWebLayout({
    super.key,
    required this.formContent,
    required this.brandingTitle,
    required this.brandingSubtitle,
    this.formKey,
  });

  final List<Widget> formContent;
  final String brandingTitle;
  final String brandingSubtitle;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LucyFlexTheme.primaryGradient(context),
            ),
            child: AuthTwinklingStarsBackground(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.all(LucyConstants.kSpacingLarge * 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LucyLogo(size: 96),
                      const SizedBox(height: LucyConstants.kSpacingLarge),
                      Text(
                        brandingTitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: scheme.onPrimary,
                        ),
                      ),
                      const SizedBox(height: LucyConstants.kSpacingLow),
                      Text(
                        brandingSubtitle,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: scheme.onPrimary.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: LucyConstants.kSpacingLarge,
              ),
              child: LucyFormContainer(
                formKey: formKey,
                children: formContent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
