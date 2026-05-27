import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/chat_data_provider.dart';
import '../../services/chat_service.dart';
import '../repositories/chat_repository.dart';

part 'chat_provider.g.dart';

@Riverpod(keepAlive: true)
ChatRepository chatRepository(Ref ref) {
  return ref.watch(chatRepositoryImplProvider);
}

@Riverpod(keepAlive: true)
ChatService chatService(Ref ref) {
  return ChatService(repository: ref.watch(chatRepositoryProvider));
}
