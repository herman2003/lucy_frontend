import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/theme/lucy_theme_extensions.dart';

/// Three-dot typing animation for Lucy assistant bubbles.
class LucyTypingDots extends StatefulWidget {
  const LucyTypingDots({super.key});

  @override
  State<LucyTypingDots> createState() => _LucyTypingDotsState();
}

class _LucyTypingDotsState extends State<LucyTypingDots>
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
    final lucy = context.lucyTheme;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final phase = (_controller.value + index * 0.2) % 1.0;
            final scale =
                0.6 + (phase < 0.5 ? phase * 0.8 : (1 - phase) * 0.8);
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : LucySpacing.spaceXs,
              ),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: lucy.muted,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
