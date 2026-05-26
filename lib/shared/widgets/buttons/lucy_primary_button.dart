import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/build_context_responsive.dart';
import '../../../core/extensions/context.dart';

/// Primary action button — flat [ColorScheme.primary] (no gradient).
class LucyPrimaryButton extends StatelessWidget {
  const LucyPrimaryButton({
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
    final enabled = !isLoading && onPressed != null;
    final buttonWidth =
        width ??
        (context.isDesktop
            ? context.screenWidth * 0.2.clamp(0.15, 0.3)
            : context.screenWidth * 0.85);

    final child = (isLoading && showLoader)
        ? SizedBox(
            width: LucyConstants.kIconMedium,
            height: LucyConstants.kIconMedium,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(scheme.onPrimary),
            ),
          )
        : Text(
            text,
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              color: scheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          );

    final button = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(LucyConstants.kButtonBorderRadius),
        child: Ink(
          decoration: BoxDecoration(
            color: enabled
                ? scheme.primary
                : scheme.onSurface.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(
              LucyConstants.kButtonBorderRadius,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: LucyConstants.kSpacingLarge,
              vertical: LucyConstants.kSpacingMedium,
            ),
            child: child,
          ),
        ),
      ),
    );

    if (width == double.infinity) {
      return SizedBox(width: double.infinity, child: button);
    }

    return SizedBox(width: buttonWidth, child: button);
  }
}
