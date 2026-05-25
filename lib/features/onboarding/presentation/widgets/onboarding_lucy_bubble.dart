import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_chat_constants.dart';
import '../../../../core/constants/lucy_constants.dart';
import '../../../../shared/widgets/branding/lucy_avatar.dart';

/// Lucy message bubble (SPEC §4.5.1).
class OnboardingLucyBubble extends StatelessWidget {
  const OnboardingLucyBubble({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const LucyAvatar(size: LucyChatConstants.kAvatarSize),
        const SizedBox(width: LucyConstants.kSpacingLow),
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
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: scheme.onSurface,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
