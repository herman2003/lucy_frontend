import '../../domain/entities/chat_local_mirror.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_thread.dart';
import '../models/chat_message_model.dart';
import '../models/chat_source_model.dart';
import '../models/chat_thread_model.dart';
import 'chat_mapper.dart';

abstract final class ChatLocalMirrorMapper {
  ChatLocalMirrorMapper._();

  static Map<String, dynamic> toJson(ChatLocalMirror mirror) {
    return {
      'threads': mirror.threads.map(_threadToJson).toList(),
      'messagesByChatId': mirror.messagesByChatId.map(
        (chatId, messages) =>
            MapEntry(chatId, messages.map(_messageToJson).toList()),
      ),
      if (mirror.lastActiveChatId != null)
        'lastActiveChatId': mirror.lastActiveChatId,
      if (mirror.composerDraftByChatId.isNotEmpty)
        'composerDraftByChatId': mirror.composerDraftByChatId,
      if (mirror.streamDraftByChatId.isNotEmpty)
        'streamDraftByChatId': mirror.streamDraftByChatId,
      'syncedAt': mirror.syncedAt,
    };
  }

  static ChatLocalMirror? fromJson(Map<String, dynamic> json) {
    final threadsRaw = json['threads'];
    if (threadsRaw is! List) {
      return null;
    }

    final threads = <ChatThread>[];
    for (final entry in threadsRaw) {
      if (entry is! Map<String, dynamic>) {
        continue;
      }
      threads.add(ChatMapper.threadFromModel(ChatThreadModel.fromJson(entry)));
    }

    final messagesByChatId = <String, List<ChatMessage>>{};
    final messagesRaw = json['messagesByChatId'];
    if (messagesRaw is Map) {
      for (final entry in messagesRaw.entries) {
        final key = entry.key;
        final value = entry.value;
        if (key is! String || value is! List) {
          continue;
        }
        final messages = <ChatMessage>[];
        for (final item in value) {
          if (item is! Map<String, dynamic>) {
            continue;
          }
          messages.add(
            ChatMapper.messageFromModel(ChatMessageModel.fromJson(item)),
          );
        }
        messagesByChatId[key] = messages;
      }
    }

    final composerDraft = _stringMap(json['composerDraftByChatId']);
    final streamDraft = _stringMap(json['streamDraftByChatId']);

    return ChatLocalMirror(
      threads: threads,
      messagesByChatId: messagesByChatId,
      lastActiveChatId: json['lastActiveChatId'] as String?,
      composerDraftByChatId: composerDraft,
      streamDraftByChatId: streamDraft,
      syncedAt: json['syncedAt'] is String ? json['syncedAt'] as String : '',
    );
  }

  static Map<String, dynamic> _threadToJson(ChatThread thread) {
    return ChatThreadModel(
      id: thread.id,
      title: thread.title,
      updatedAt: thread.updatedAt,
      createdAt: thread.createdAt,
      lastMessagePreview: thread.lastMessagePreview,
    ).toJson();
  }

  static Map<String, dynamic> _messageToJson(ChatMessage message) {
    return ChatMessageModel(
      id: message.id,
      role: message.role.toApi(),
      content: message.content,
      createdAt: message.createdAt,
      status: message.status?.toApi(),
      sources: message.sources
          ?.map(
            (source) => ChatSourceModel(
              documentId: source.documentId,
              title: source.title,
              chunkId: source.chunkId,
              excerpt: source.excerpt,
              pageStart: source.pageStart,
              pageEnd: source.pageEnd,
              score: source.score,
            ),
          )
          .toList(),
    ).toJson();
  }

  static Map<String, String> _stringMap(Object? raw) {
    if (raw is! Map) {
      return const {};
    }
    return Map<String, String>.fromEntries(
      raw.entries
          .where((entry) => entry.key is String && entry.value is String)
          .map((entry) => MapEntry(entry.key as String, entry.value as String)),
    );
  }
}
