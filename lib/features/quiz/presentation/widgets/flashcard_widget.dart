import 'dart:math' show pi;

import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

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
    final label = isFlipped
        ? l10n.flashcardsSessionBack
        : l10n.flashcardsSessionFront;
    final text = isFlipped ? back : front;

    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: lucy.surfaceSecondary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(LucySpacing.radiusCard),
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
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ));
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
              height: 240,
              child: Padding(
                padding: const EdgeInsets.all(LucySpacing.spaceXl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      label,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: scheme.onSurface,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      l10n.flashcardsSessionTapToFlip,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: lucy.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
