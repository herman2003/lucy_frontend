import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
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
  });

  final List<OnboardingChatMessage> messages;
  final bool showTypingIndicator;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
    );
  }
}
