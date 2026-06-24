import 'package:flutter/material.dart';

import '../../../core/constants/lucy_assets.dart';

/// Shared Lucy avatar for chat bubbles and typing indicator (SPEC §4.5.1, R1).
///
/// Placeholder: [Icons.auto_awesome] until [LucyAssets.lucyAvatar] is added
/// under `assets/branding/` — then switch to [Image.asset] in this widget.
class LucyAvatar extends StatelessWidget {
  const LucyAvatar({
    super.key,
    this.size = 40,
    this.useAssetWhenAvailable = false,
  });

  final double size;

  /// Set true once `assets/branding/lucy_avatar.png` exists in the bundle.
  final bool useAssetWhenAvailable;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: colorScheme.primary,
      child: useAssetWhenAvailable
          ? ClipOval(
              child: Image.asset(
                LucyAssets.lucyAvatar,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _fallbackIcon(colorScheme),
              ),
            )
          : _fallbackIcon(colorScheme),
    );
  }

  Widget _fallbackIcon(ColorScheme colorScheme) {
    return Icon(Icons.auto_awesome, size: size * 0.55, color: Colors.white);
  }
}
