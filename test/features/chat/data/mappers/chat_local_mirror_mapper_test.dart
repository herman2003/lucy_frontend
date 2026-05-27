import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/chat/data/mappers/chat_local_mirror_mapper.dart';
import 'package:frontend/features/chat/domain/entities/chat_local_mirror.dart';
import 'package:frontend/features/chat/domain/entities/chat_message.dart';
import 'package:frontend/features/chat/domain/entities/chat_message_role.dart';
import 'package:frontend/features/chat/domain/entities/chat_thread.dart';

void main() {
  test('round-trip preserves threads and messages', () {
    const mirror = ChatLocalMirror(
      threads: [
        ChatThread(
          id: 'chat-1',
          title: 'Biologie',
          updatedAt: '2026-05-27T10:00:00Z',
          lastMessagePreview: 'Bonjour',
        ),
      ],
      messagesByChatId: {
        'chat-1': [
          ChatMessage(
            id: 'm1',
            role: ChatMessageRole.user,
            content: 'Question',
            createdAt: '2026-05-27T10:00:01Z',
          ),
        ],
      },
      lastActiveChatId: 'chat-1',
      syncedAt: '2026-05-27T10:00:02Z',
    );

    final json = ChatLocalMirrorMapper.toJson(mirror);
    final restored = ChatLocalMirrorMapper.fromJson(json);

    expect(restored, isNotNull);
    expect(restored!.threads.single.id, 'chat-1');
    expect(restored.messagesByChatId['chat-1']!.single.content, 'Question');
    expect(restored.lastActiveChatId, 'chat-1');
    expect(restored.syncedAt, '2026-05-27T10:00:02Z');
  });
}
