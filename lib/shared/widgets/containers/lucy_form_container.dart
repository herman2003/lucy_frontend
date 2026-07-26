import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/build_context_responsive.dart';
import '../../../core/extensions/context.dart';

/// White form card for auth pages (uses [ColorScheme.surface]).
class LucyFormContainer extends StatelessWidget {
  const LucyFormContainer({super.key, this.formKey, required this.children});

  final GlobalKey<FormState>? formKey;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final isDesktop = context.isDesktop;

    final horizontalPadding = isDesktop
        ? context.screenWidth * 0.04
        : context.screenWidth * 0.04;

    final verticalPadding = isDesktop
        ? context.screenHeight * 0.03
        : context.screenHeight * 0.04;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: LucyConstants.kAuthCardMaxWidth,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(
              LucyConstants.kBorderRadiusAuthCard,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 40,
                color: scheme.primary.withValues(alpha: 0.25),
              ),
            ],
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
