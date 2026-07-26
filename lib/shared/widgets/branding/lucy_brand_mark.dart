import 'package:flutter/material.dart';

import '../../../core/theme/lucy_colors.dart';
import '../../../core/theme/lucy_typography.dart';

/// Lucy logo mark — gradient tile with « L » (design system).
class LucyBrandMark extends StatelessWidget {
  const LucyBrandMark({
    super.key,
    this.size = 40,
    this.showStar = true,
  });

  final double size;
  final bool showStar;

  @override
  Widget build(BuildContext context) {
    final radius = size * 0.3;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              gradient: const RadialGradient(
                center: Alignment(-0.2, -0.25),
                radius: 1.2,
                colors: [Color(0xFF4F79D6), LucyColors.primary, Color(0xFF1C7C6E)],
                stops: [0.0, 0.55, 1.0],
              ),
            ),
            child: Center(
              child: Text(
                'L',
                style: LucyTypography.brandMark(
                  size: size * 0.55,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (showStar)
            Positioned(
              top: -2,
              right: -2,
              child: Text(
                '✦',
                style: TextStyle(
                  fontSize: size * 0.28,
                  color: const Color(0xFFFBEED0),
                  height: 1,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
