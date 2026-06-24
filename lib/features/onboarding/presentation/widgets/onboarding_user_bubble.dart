import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_chat_constants.dart';
import '../../../../core/constants/lucy_constants.dart';

/// Learner message bubble (SPEC §4.5.1).
class OnboardingUserBubble extends StatelessWidget {
  const OnboardingUserBubble({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.sizeOf(context).width *
                  LucyChatConstants.kMaxBubbleWidthFactor,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: LucyConstants.kSpacingMedium,
              vertical: LucyConstants.kSpacingLow + 4,
            ),
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: LucyChatConstants.userBubbleRadius,
            ),
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: LucyConstants.kSpacingLow),
        CircleAvatar(
          radius: LucyChatConstants.kAvatarSize / 2,
          backgroundColor: scheme.primary,
          child: Icon(
            Icons.person_outline,
            color: Colors.white,
            size: LucyConstants.kIconMedium,
          ),
        ),
      ],
    );
  }
}
