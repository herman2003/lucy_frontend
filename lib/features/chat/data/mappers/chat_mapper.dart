import '../../domain/entities/chat_eligibility.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_message_role.dart';
import '../../domain/entities/chat_message_status.dart';
import '../../domain/entities/chat_source.dart';
import '../../domain/entities/chat_thread.dart';
import '../models/chat_eligibility_model.dart';
import '../models/chat_message_model.dart';
import '../models/chat_source_model.dart';
import '../models/chat_thread_model.dart';

abstract final class ChatMapper {
  ChatMapper._();

  static ChatThread threadFromJson(Map<String, dynamic> json) =>
      threadFromModel(ChatThreadModel.fromJson(json));

  static ChatThread threadFromModel(ChatThreadModel model) => ChatThread(
    id: model.id,
    title: model.title,
    updatedAt: model.updatedAt,
    createdAt: model.createdAt,
    lastMessagePreview: model.lastMessagePreview,
  );

  static ChatMessage messageFromJson(Map<String, dynamic> json) =>
      messageFromModel(ChatMessageModel.fromJson(json));

  static ChatMessage messageFromModel(ChatMessageModel model) => ChatMessage(
    id: model.id,
    role: ChatMessageRole.fromApi(model.role),
    content: model.content,
    createdAt: model.createdAt,
    status: ChatMessageStatus.fromApi(model.status),
    sources: model.sources?.map(sourceFromModel).toList(),
  );

  static ChatSource sourceFromModel(ChatSourceModel model) => ChatSource(
    documentId: model.documentId,
    title: model.title,
    chunkId: model.chunkId,
    excerpt: model.excerpt,
    pageStart: model.pageStart,
    pageEnd: model.pageEnd,
    score: model.score,
  );

  static ChatEligibility eligibilityFromJson(Map<String, dynamic> json) =>
      eligibilityFromModel(ChatEligibilityModel.fromJson(json));

  static ChatEligibility eligibilityFromModel(ChatEligibilityModel model) =>
      ChatEligibility(
        canChat: model.canChat,
        activeDocumentCount: model.activeDocumentCount,
      );
}
