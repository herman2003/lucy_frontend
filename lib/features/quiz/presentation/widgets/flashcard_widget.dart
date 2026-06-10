import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';

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
    final scheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;
    final label = isFlipped ? l10n.flashcardsSessionBack : l10n.flashcardsSessionFront;
    final text = isFlipped ? back : front;

    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: scheme.primaryContainer,
        elevation: 2,
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
        child: InkWell(
          onTap: onFlip,
          borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: SizedBox(
              key: ValueKey<bool>(isFlipped),
              width: double.infinity,
              height: 220,
              child: Padding(
                padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: scheme.onPrimaryContainer,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: scheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      l10n.flashcardsSessionTapToFlip,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onPrimaryContainer.withValues(alpha: 0.8),
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
