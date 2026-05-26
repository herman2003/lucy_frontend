import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/build_context_responsive.dart';
import '../../../core/extensions/context.dart';

/// Outlined secondary button — uses [ColorScheme.primary] by default (swap via theme).
class LucySecondaryButton extends StatelessWidget {
  const LucySecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.showLoader = true,
    this.width,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool showLoader;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final buttonWidth = width ??
        (context.isDesktop
            ? context.screenWidth * 0.2.clamp(0.15, 0.3)
            : context.screenWidth * 0.85);

    final button = OutlinedButton(
      onPressed: (isLoading || onPressed == null) ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.primary,
        side: BorderSide(color: scheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LucyConstants.kButtonBorderRadius),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: LucyConstants.kSpacingLarge,
          vertical: LucyConstants.kSpacingMedium,
        ),
      ),
      child: (isLoading && showLoader)
          ? SizedBox(
              width: LucyConstants.kIconMedium,
              height: LucyConstants.kIconMedium,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(scheme.primary),
              ),
            )
          : Text(
              text,
              textAlign: TextAlign.center,
              style: context.textTheme.labelLarge?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
    );

    if (width == double.infinity) {
      return SizedBox(width: double.infinity, child: button);
    }

    return SizedBox(width: buttonWidth, child: button);
  }
}
