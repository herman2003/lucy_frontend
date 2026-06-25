import 'dart:math' show pi;

import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_colors.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../core/theme/lucy_typography.dart';

class FlashcardWidget extends StatelessWidget {
  const FlashcardWidget({
    super.key,
    required this.front,
    required this.back,
    required this.isFlipped,
    required this.onFlip,
  });

  final String front;
  final String back;
  final bool isFlipped;
  final VoidCallback onFlip;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final l10n = context.l10n;
    final sideLabel = isFlipped
        ? l10n.flashcardsSessionBack
        : l10n.flashcardsSessionFront;
    final text = isFlipped ? back : front;
    final cardColor = isFlipped
        ? LucyColors.surfaceElevatedLight
        : scheme.surface;

    return Semantics(
      button: true,
      label: sideLabel,
      child: Material(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LucySpacing.radiusLarge + 2),
          side: BorderSide(color: lucy.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onFlip,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 350),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              final rotate = Tween<double>(
                begin: pi / 2,
                end: 0,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );
              return AnimatedBuilder(
                animation: rotate,
                child: child,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(rotate.value),
                    child: child,
                  );
                },
              );
            },
            layoutBuilder: (currentChild, previousChildren) => currentChild!,
            child: SizedBox(
              key: ValueKey<bool>(isFlipped),
              width: double.infinity,
              height: 260,
              child: Stack(
                children: [
                  Positioned(
                    top: LucySpacing.spaceLg,
                    left: LucySpacing.spaceLg + 2,
                    child: Text(
                      sideLabel.toUpperCase(),
                      style: context.textTheme.labelSmall?.copyWith(
                        color: scheme.tertiary,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: LucySpacing.spaceXl + 6,
                      ),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: LucyTypography.editorialQuote(
                          fontSize: 24,
                          color: scheme.onSurface,
                        ).copyWith(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: LucySpacing.spaceLg,
                    left: 0,
                    right: 0,
                    child: Text(
                      l10n.flashcardsSessionTapToFlip,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: lucy.faint,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
