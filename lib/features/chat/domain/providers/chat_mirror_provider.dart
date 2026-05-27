import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/providers/auth_provider.dart';
import '../../data/datasources/chat_local_mirror_prefs_data_source.dart';
import '../../data/repositories/chat_local_mirror_repository_impl.dart';
import '../../domain/repositories/chat_local_mirror_repository.dart';
import '../../services/chat_mirror_service.dart';

part 'chat_mirror_provider.g.dart';

@Riverpod(keepAlive: true)
ChatLocalMirrorPrefsDataSource chatLocalMirrorPrefsDataSource(Ref ref) {
  return ChatLocalMirrorPrefsDataSource();
}

@Riverpod(keepAlive: true)
ChatLocalMirrorRepository chatLocalMirrorRepository(Ref ref) {
  return ChatLocalMirrorRepositoryImpl(
    ref.watch(chatLocalMirrorPrefsDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
ChatMirrorService chatMirrorService(Ref ref) {
  return ChatMirrorService(repository: ref.watch(chatLocalMirrorRepositoryProvider));
}

/// Purges chat mirror when Firebase session ends (spec §3.4).
@Riverpod(keepAlive: true)
void chatMirrorLogoutListener(Ref ref) {
  ref.listen(authStateChangesProvider, (previous, next) {
    final priorUid = previous?.value?.uid;
    final nextUid = next.value?.uid;
    if (priorUid != null && nextUid == null) {
      unawaited(ref.read(chatMirrorServiceProvider).removeMirror(priorUid));
    }
  });
}
