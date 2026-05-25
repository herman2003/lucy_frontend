import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';

/// Three-dot typing animation for Lucy (SPEC §4.5.1).
class OnboardingTypingDots extends StatefulWidget {
  const OnboardingTypingDots({super.key});

  @override
  State<OnboardingTypingDots> createState() => _OnboardingTypingDotsState();
}

class _OnboardingTypingDotsState extends State<OnboardingTypingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final dotColor = scheme.onSurfaceVariant;

    return KeyedSubtree(
      key: const Key('onboarding_typing_dots'),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (index) {
              final phase = (_controller.value + index * 0.2) % 1.0;
              final scale = 0.6 + (phase < 0.5 ? phase * 0.8 : (1 - phase) * 0.8);
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 0 : LucyConstants.kSpacingLow / 3,
                ),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
