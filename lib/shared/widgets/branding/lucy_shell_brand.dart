import 'package:flutter/material.dart';

import '../../../core/constants/lucy_constants.dart';
import '../../../core/extensions/context.dart';

/// Lucy logo block for the desktop shell sidebar.
class LucyShellBrand extends StatelessWidget {
  const LucyShellBrand({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.psychology_outlined,
          size: LucyConstants.kIconMedium,
          color: scheme.primary,
        ),
        const SizedBox(width: LucyConstants.kSpacingLow),
        Text(
          context.l10n.appTitle,
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
