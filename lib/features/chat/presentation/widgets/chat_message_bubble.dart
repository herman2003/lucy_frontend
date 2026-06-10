import 'package:flutter/material.dart';

import '../../../onboarding/presentation/widgets/onboarding_lucy_bubble.dart';
import '../../../onboarding/presentation/widgets/onboarding_user_bubble.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_message_role.dart';
import 'chat_source_card.dart';

/// Renders a persisted chat message with optional source cards.
class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final bubble = switch (message.role) {
      ChatMessageRole.user => OnboardingUserBubble(text: message.content),
      ChatMessageRole.assistant => OnboardingLucyBubble(text: message.content),
    };

    final sources = message.sources;
    if (sources == null || sources.isEmpty) {
      return bubble;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        bubble,
        const SizedBox(height: 8),
        ...sources.map((source) => ChatSourceCard(source: source)),
      ],
    );
  }
}
