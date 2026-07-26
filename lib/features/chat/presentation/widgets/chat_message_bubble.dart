import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/lucy/lucy_message_bubble.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_message_role.dart';

/// Renders a persisted chat message with optional source cards.
class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final sources = message.sources;
    final sourceData = sources == null
        ? const <LucyMessageSourceData>[]
        : sources
              .map(
                (source) => LucyMessageSourceData(
                  title: source.title,
                  excerpt: source.excerpt,
                  pagesLabel: _pagesLabel(context, source.pageStart, source.pageEnd),
                ),
              )
              .toList();

    return LucyMessageBubble(
      role: message.role == ChatMessageRole.user
          ? LucyMessageBubbleRole.user
          : LucyMessageBubbleRole.assistant,
      text: message.content,
      sources: sourceData,
    );
  }

  String? _pagesLabel(BuildContext context, int? start, int? end) {
    if (start == null || end == null) {
      return null;
    }
    return context.l10n.chatSourcePages(start, end);
  }
}
