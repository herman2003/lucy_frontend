import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/providers/auth_provider.dart';
import 'package:frontend/features/chat/domain/entities/chat_thread.dart';
import 'package:frontend/features/chat/domain/providers/chat_mirror_provider.dart';
import 'package:frontend/features/chat/domain/providers/chat_provider.dart';
import 'package:frontend/features/chat/presentation/controllers/chat_threads_notifier.dart';
import 'package:frontend/features/chat/services/chat_service.dart';

import '../helpers/fake_auth_repository.dart';
import '../helpers/fake_chat_repository.dart';

class _OfflineChatRepository extends FakeChatRepository {
  @override
  Future<List<ChatThread>> listThreads() {
    throw DioException(
      requestOptions: RequestOptions(path: '/v1/chats'),
      type: DioExceptionType.connectionError,
    );
  }
}

void main() {
  test('bootstrap exposes cached threads before API when offline', () async {
    const uid = 'user-1';
    const cachedThread = ChatThread(
      id: 'chat-cached',
      title: 'Cache local',
      updatedAt: '2026-05-27T12:00:00Z',
    );

    SharedPreferences.setMockInitialValues({});

    final container = ProviderContainer(
      overrides: [
        authRepositoryProvider.overrideWithValue(
          FakeAuthRepository(
            user: const AuthUser(uid: uid, email: 'a@b.com'),
          ),
        ),
        chatRepositoryProvider.overrideWithValue(_OfflineChatRepository()),
        chatServiceProvider.overrideWith(
          (ref) => ChatService(repository: ref.watch(chatRepositoryProvider)),
        ),
      ],
    );
    addTearDown(container.dispose);

    await container.read(chatMirrorServiceProvider).saveThreads(
      uid: uid,
      threads: const [cachedThread],
      lastActiveChatId: cachedThread.id,
    );

    final notifier = container.read(chatThreadsProvider.notifier);
    await notifier.bootstrap();

    final state = container.read(chatThreadsProvider);
    expect(state.threads.single.id, cachedThread.id);
    expect(state.isOffline, isTrue);
    expect(state.isLoading, isFalse);
  });
}
