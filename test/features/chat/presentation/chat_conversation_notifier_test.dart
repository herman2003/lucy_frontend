import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/chat/domain/providers/chat_provider.dart';
import 'package:frontend/features/chat/presentation/controllers/chat_conversation_notifier.dart';
import 'package:frontend/features/chat/presentation/controllers/chat_send_phase.dart';
import 'package:frontend/features/chat/services/chat_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/fake_auth_repository.dart';
import '../helpers/fake_chat_repository.dart';

void main() {
  group('ChatConversationNotifier', () {
    test('aggregates stream deltas and completes with assistant message', () async {
      SharedPreferences.setMockInitialValues({});
      final repository = FakeChatRepository();
      final container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(
            FakeAuthRepository(
              user: const AuthUser(uid: 'user-1', email: 'a@b.com'),
            ),
          ),
          chatRepositoryProvider.overrideWithValue(repository),
          chatServiceProvider.overrideWith(
            (ref) => ChatService(repository: repository),
          ),
        ],
      );
      addTearDown(container.dispose);

      final thread = await repository.createThread();
      final notifier = container.read(
        chatConversationProvider(thread.id).notifier,
      );

      await notifier.sendMessage('Salut');

      final state = container.read(
        chatConversationProvider(thread.id),
      );

      expect(state.sendPhase, ChatSendPhase.idle);
      expect(state.messages, hasLength(2));
      expect(state.messages.last.content, 'Bonjour Lucy');
      expect(state.messages.last.sources, isNotEmpty);
      expect(state.streamingContent, isEmpty);
    });
  });
}
