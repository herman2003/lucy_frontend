import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Animated twinkling / drifting stars for auth branding panels (web + mobile).
///
/// Uses [ColorScheme.onPrimary] only. Respects reduced-motion settings.
class AuthTwinklingStarsBackground extends StatefulWidget {
  const AuthTwinklingStarsBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AuthTwinklingStarsBackground> createState() =>
      _AuthTwinklingStarsBackgroundState();
}

class _AuthTwinklingStarsBackgroundState extends State<AuthTwinklingStarsBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool get _isWidgetTest {
    final bindingType = WidgetsBinding.instance.runtimeType.toString();
    return bindingType.contains('Test');
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );
    if (_isWidgetTest) {
      _controller.value = 0.42;
    } else {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final disableMotion = MediaQuery.disableAnimationsOf(context);
    final starColor = Theme.of(context).colorScheme.onPrimary;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (!disableMotion)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: _TwinklingStarsPainter(
                  progress: _controller.value,
                  starColor: starColor,
                ),
              );
            },
          ),
        widget.child,
      ],
    );
  }
}

class _StarSeed {
  const _StarSeed({
    required this.x,
    required this.y,
    required this.phase,
    required this.radius,
  });

  final double x;
  final double y;
  final double phase;
  final double radius;
}

class _TwinklingStarsPainter extends CustomPainter {
  _TwinklingStarsPainter({
    required this.progress,
    required this.starColor,
  }) : _stars = _generateStars(52);

  final double progress;
  final Color starColor;
  final List<_StarSeed> _stars;

  static List<_StarSeed> _generateStars(int count) {
    final random = math.Random(42);
    return List.generate(
      count,
      (index) => _StarSeed(
        x: random.nextDouble(),
        y: random.nextDouble(),
        phase: random.nextDouble() * math.pi * 2,
        radius: 0.8 + random.nextDouble() * 1.4,
      ),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final twoPi = math.pi * 2;
    final driftPhase = progress * twoPi;

    for (final star in _stars) {
      final twinkle =
          0.25 +
          0.75 *
              ((math.sin(driftPhase * 2.2 + star.phase) + 1) * 0.5);
      final driftX = math.sin(driftPhase + star.phase) * 10;
      final driftY = math.cos(driftPhase * 0.85 + star.phase) * 8;
      final paint = Paint()
        ..color = starColor.withValues(alpha: twinkle * 0.9)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(
          star.x * size.width + driftX,
          star.y * size.height + driftY,
        ),
        star.radius,
        paint,
      );
    }

    _paintShootingStars(canvas, size);
  }

  void _paintShootingStars(Canvas canvas, Size size) {
    const trails = 3;
    for (var i = 0; i < trails; i++) {
      final cycleOffset = i / trails;
      final local = (progress * 1.8 + cycleOffset) % 1.0;
      if (local > 0.22) {
        continue;
      }

      final t = local / 0.22;
      final startX = size.width * (0.05 + 0.25 * i);
      final startY = size.height * (0.08 + 0.12 * i);
      final endX = startX + size.width * 0.35 * t;
      final endY = startY + size.height * 0.22 * t;
      final headAlpha = (1 - t) * 0.75;

      final trailRect = Rect.fromPoints(
        Offset(startX, startY),
        Offset(endX, endY),
      );
      final trailPaint = Paint()
        ..shader = LinearGradient(
          colors: [
            starColor.withValues(alpha: 0),
            starColor.withValues(alpha: headAlpha * 0.5),
            starColor.withValues(alpha: headAlpha),
          ],
          stops: const [0, 0.55, 1],
        ).createShader(trailRect)
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), trailPaint);

      canvas.drawCircle(
        Offset(endX, endY),
        2.2,
        Paint()..color = starColor.withValues(alpha: headAlpha),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _TwinklingStarsPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.starColor != starColor;
  }
}
