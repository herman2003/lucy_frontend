import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/chat/presentation/controllers/chat_conversation_state.dart';
import 'package:lucy_frontend/features/chat/presentation/controllers/chat_send_phase.dart';
import 'package:lucy_frontend/features/chat/presentation/utils/chat_conversation_status_resolver.dart';
import 'package:lucy_frontend/features/chat/presentation/widgets/lucy_conversation_status.dart';

void main() {
  group('ChatConversationStatusResolver', () {
    test('returns noCorpus when cannot chat and no messages', () {
      const conversation = ChatConversationState();
      expect(
        ChatConversationStatusResolver.resolve(
          conversation: conversation,
          isOffline: false,
          canChat: false,
        ),
        LucyConversationStatusType.noCorpus,
      );
    });

    test('returns ready when streaming even without persisted messages', () {
      const conversation = ChatConversationState(
        sendPhase: ChatSendPhase.streaming,
        streamingContent: 'Hello',
      );
      expect(
        ChatConversationStatusResolver.resolve(
          conversation: conversation,
          isOffline: false,
          canChat: true,
        ),
        LucyConversationStatusType.ready,
      );
    });
  });
}
