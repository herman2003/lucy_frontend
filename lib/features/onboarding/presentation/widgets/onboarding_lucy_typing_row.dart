import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../shared/widgets/branding/lucy_avatar.dart';

/// Typing indicator while validate-answer is in flight (SPEC §4.5.1).
class OnboardingLucyTypingRow extends StatelessWidget {
  const OnboardingLucyTypingRow({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        const LucyAvatar(size: 36),
        const SizedBox(width: LucyConstants.kSpacingLow),
        SizedBox(
          width: LucyConstants.kIconMedium,
          height: LucyConstants.kIconMedium,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: scheme.primary,
          ),
        ),
      ],
    );
  }
}
