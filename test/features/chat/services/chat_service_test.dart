import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/chat/domain/entities/chat_eligibility.dart';
import 'package:lucy_frontend/features/chat/services/chat_service.dart';

import '../helpers/fake_chat_repository.dart';

void main() {
  group('ChatService', () {
    test('createThread and listThreads use fake repository', () async {
      final repository = FakeChatRepository();
      final service = ChatService(repository: repository);

      final created = await service.createThread(title: 'Biologie');
      final threads = await service.listThreads();

      expect(created.title, 'Biologie');
      expect(threads.single.id, created.id);
    });

    test('getEligibility returns repository value', () async {
      final repository = FakeChatRepository(
        eligibility: const ChatEligibility(
          canChat: false,
          activeDocumentCount: 0,
        ),
      );
      final service = ChatService(repository: repository);

      final eligibility = await service.getEligibility();

      expect(eligibility.canChat, isFalse);
      expect(eligibility.activeDocumentCount, 0);
    });

    test('deleteThread removes thread from list', () async {
      final repository = FakeChatRepository();
      final service = ChatService(repository: repository);
      final thread = await service.createThread();

      await service.deleteThread(thread.id);

      expect(await service.listThreads(), isEmpty);
    });
  });
}
