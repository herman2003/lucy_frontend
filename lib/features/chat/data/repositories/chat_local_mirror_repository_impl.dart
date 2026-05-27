import '../../domain/entities/chat_local_mirror.dart';
import '../../domain/repositories/chat_local_mirror_repository.dart';
import '../datasources/chat_local_mirror_prefs_data_source.dart';
import '../mappers/chat_local_mirror_mapper.dart';

class ChatLocalMirrorRepositoryImpl implements ChatLocalMirrorRepository {
  ChatLocalMirrorRepositoryImpl(this._dataSource);

  final ChatLocalMirrorPrefsDataSource _dataSource;

  @override
  Future<ChatLocalMirror?> load({required String uid}) async {
    final json = await _dataSource.readMirrorJson(uid);
    if (json == null) {
      return null;
    }
    return ChatLocalMirrorMapper.fromJson(json);
  }

  @override
  Future<void> save({required String uid, required ChatLocalMirror mirror}) {
    return _dataSource.writeMirrorJson(uid, ChatLocalMirrorMapper.toJson(mirror));
  }

  @override
  Future<void> remove({required String uid}) {
    return _dataSource.removeMirror(uid);
  }
}
