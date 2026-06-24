import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/context.dart';

/// Lucy branding mark for auth screens.
class LucyLogo extends StatelessWidget {
  const LucyLogo({super.key, this.size = 72, this.showTitle = true});

  final double size;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.psychology_outlined, size: size, color: scheme.onPrimary),
        if (showTitle) ...[
          const SizedBox(height: LucyConstants.kSpacingLow),
          Text(
            context.l10n.appTitle,
            style: context.textTheme.headlineSmall?.copyWith(
              color: scheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}
