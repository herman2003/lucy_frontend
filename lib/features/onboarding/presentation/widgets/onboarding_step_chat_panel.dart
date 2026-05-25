import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../domain/entities/onboarding_chat_message.dart';
import 'onboarding_lucy_bubble.dart';
import 'onboarding_lucy_typing_row.dart';
import 'onboarding_user_bubble.dart';

/// Vertical chat thread for a single onboarding step (SPEC §4.5.1).
class OnboardingStepChatPanel extends StatelessWidget {
  const OnboardingStepChatPanel({
    super.key,
    required this.messages,
    required this.showTypingIndicator,
    this.readOnly = false,
  });

  final List<OnboardingChatMessage> messages;
  final bool showTypingIndicator;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        if (readOnly)
          Material(
            color: scheme.surfaceContainerLow,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LucyConstants.kSpacingMedium,
                vertical: LucyConstants.kSpacingLow,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.visibility_outlined,
                    size: LucyConstants.kIconMedium,
                    color: scheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: LucyConstants.kSpacingLow),
                  Expanded(
                    child: Text(
                      context.l10n.onboardingStepReadOnly,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
            itemCount: messages.length + (showTypingIndicator ? 1 : 0),
            separatorBuilder: (_, _) =>
                const SizedBox(height: LucyConstants.kSpacingMedium),
            itemBuilder: (context, index) {
              if (index >= messages.length) {
                return const OnboardingLucyTypingRow();
              }
              final message = messages[index];
              return message.isFromLucy
                  ? OnboardingLucyBubble(text: message.text)
                  : OnboardingUserBubble(text: message.text);
            },
          ),
        ),
      ],
    );
  }
}
