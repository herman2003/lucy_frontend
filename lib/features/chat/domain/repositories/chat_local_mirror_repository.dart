import '../entities/chat_local_mirror.dart';

/// Local chat mirror persistence (spec §3.4).
abstract class ChatLocalMirrorRepository {
  Future<ChatLocalMirror?> load({required String uid});

  Future<void> save({required String uid, required ChatLocalMirror mirror});

  Future<void> remove({required String uid});
}
