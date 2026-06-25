import 'package:flutter/material.dart';

import '../../../core/theme/lucy_theme_extensions.dart';
import '../../../core/constants/lucy_assets.dart';

/// Shared Lucy avatar for chat bubbles and typing indicator (design system gradient).
class LucyAvatar extends StatefulWidget {
  const LucyAvatar({
    super.key,
    this.size = 40,
    this.useAssetWhenAvailable = false,
    this.pulsing = false,
  });

  final double size;
  final bool useAssetWhenAvailable;
  final bool pulsing;

  @override
  State<LucyAvatar> createState() => _LucyAvatarState();
}

class _LucyAvatarState extends State<LucyAvatar>
    with SingleTickerProviderStateMixin {
  AnimationController? _pulseController;

  @override
  void initState() {
    super.initState();
    if (widget.pulsing) {
      _pulseController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1400),
      )..repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant LucyAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pulsing && _pulseController == null) {
      _pulseController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1400),
      )..repeat(reverse: true);
    } else if (!widget.pulsing && _pulseController != null) {
      _pulseController!.dispose();
      _pulseController = null;
    }
  }

  @override
  void dispose() {
    _pulseController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    Widget avatar = Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: lucy.lucyAvatarGradient,
        boxShadow: [
          BoxShadow(
            color: lucy.tealChipForeground.withValues(alpha: 0.25),
            blurRadius: widget.pulsing ? 12 : 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: widget.useAssetWhenAvailable
          ? ClipOval(
              child: Image.asset(
                LucyAssets.lucyAvatar,
                width: widget.size,
                height: widget.size,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _fallbackStar(),
              ),
            )
          : _fallbackStar(),
    );

    if (_pulseController != null) {
      avatar = AnimatedBuilder(
        animation: _pulseController!,
        builder: (context, child) {
          final scale = 1 + (_pulseController!.value * 0.06);
          return Transform.scale(scale: scale, child: child);
        },
        child: avatar,
      );
    }

    return avatar;
  }

  Widget _fallbackStar() {
    return Center(
      child: Text(
        '✦',
        style: TextStyle(
          color: Colors.white,
          fontSize: widget.size * 0.42,
          height: 1,
        ),
      ),
    );
  }
}
