import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/signals/pending_chat_outbound_message.dart';
import '../../../../core/signals/pending_chat_outbound_message_holder.dart';

enum QuizLibraryGenerateType { quiz, flashcards }

/// Opens chat with a professor-mode generation request (LEARN-11e).
void openQuizGenerationInChat({
  required BuildContext context,
  required WidgetRef ref,
  required QuizLibraryGenerateType type,
}) {
  final l10n = context.l10n;
  final message = switch (type) {
    QuizLibraryGenerateType.quiz => l10n.chatSuggestionQuiz,
    QuizLibraryGenerateType.flashcards => l10n.chatSuggestionFlashcards,
  };

  ref
      .read(pendingChatOutboundMessageHolderProvider.notifier)
      .enqueue(PendingChatOutboundMessage(message: message));

  context.go(LucyRoutePaths.chat);
}
