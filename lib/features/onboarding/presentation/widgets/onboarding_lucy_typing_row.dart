import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_chat_constants.dart';
import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/branding/lucy_avatar.dart';
import 'onboarding_typing_dots.dart';

/// Typing indicator while onboarding API calls are in flight (SPEC §4.5.1).
class OnboardingLucyTypingRow extends StatelessWidget {
  const OnboardingLucyTypingRow({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const LucyAvatar(size: LucyChatConstants.kLucyAvatarSize),
        const SizedBox(width: LucyChatConstants.kAvatarGap),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: LucyConstants.kSpacingMedium,
              vertical: LucyConstants.kSpacingLow + 4,
            ),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest,
              borderRadius: LucyChatConstants.lucyBubbleRadius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.onboardingLucyTyping,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: LucyConstants.kSpacingLow),
                const OnboardingTypingDots(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
