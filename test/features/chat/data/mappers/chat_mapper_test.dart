import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/chat/data/mappers/chat_mapper.dart';
import 'package:lucy_frontend/features/chat/domain/entities/chat_message_role.dart';
import 'package:lucy_frontend/features/chat/domain/entities/chat_message_status.dart';

void main() {
  group('ChatMapper', () {
    test('threadFromJson maps list item fields', () {
      final thread = ChatMapper.threadFromJson({
        'id': 'chat-1',
        'title': 'Thermo',
        'updatedAt': '2026-05-27T10:00:00.000Z',
        'lastMessagePreview': 'Question',
      });

      expect(thread.id, 'chat-1');
      expect(thread.title, 'Thermo');
      expect(thread.lastMessagePreview, 'Question');
    });

    test('messageFromJson maps assistant message with sources', () {
      final message = ChatMapper.messageFromJson({
        'id': 'msg-1',
        'role': 'assistant',
        'content': 'Réponse',
        'createdAt': '2026-05-27T10:01:00.000Z',
        'status': 'completed',
        'sources': [
          {
            'documentId': 'doc-1',
            'title': 'Cours',
            'chunkId': 'chunk-1',
            'excerpt': 'Extrait court',
            'pageStart': 2,
            'pageEnd': 3,
            'score': 0.91,
          },
        ],
      });

      expect(message.role, ChatMessageRole.assistant);
      expect(message.status, ChatMessageStatus.completed);
      expect(message.sources, isNotNull);
      expect(message.sources!.single.chunkId, 'chunk-1');
      expect(message.sources!.single.pageStart, 2);
    });

    test('eligibilityFromJson maps canChat and activeDocumentCount', () {
      final eligibility = ChatMapper.eligibilityFromJson({
        'canChat': false,
        'activeDocumentCount': 0,
      });

      expect(eligibility.canChat, isFalse);
      expect(eligibility.activeDocumentCount, 0);
    });
  });
}
