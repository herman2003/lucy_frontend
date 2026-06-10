import '../../domain/entities/generate_learning_session_request.dart';
import '../../domain/entities/learning_session.dart';
import '../../domain/entities/learning_session_item.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../domain/entities/learning_session_source.dart';
import '../../domain/entities/learning_session_status.dart';
import '../../domain/entities/learning_session_type.dart';
import '../models/learning_session_list_item_model.dart';
import '../models/learning_session_item_model.dart';
import '../models/learning_session_model.dart';
import '../models/learning_session_source_model.dart';

abstract final class LearningSessionMapper {
  LearningSessionMapper._();

  static List<LearningSessionListItem> listFromJson(List<dynamic> json) {
    return json
        .map(
          (entry) => listItemFromModel(
            LearningSessionListItemModel.fromJson(
              entry as Map<String, dynamic>,
            ),
          ),
        )
        .toList(growable: false);
  }

  static LearningSessionListItem listItemFromModel(
    LearningSessionListItemModel model,
  ) {
    return LearningSessionListItem(
      id: model.id,
      type: _parseType(model.type),
      status: _parseStatus(model.status),
      itemCount: model.itemCount,
      title: model.title,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  static LearningSession fromJson(Map<String, dynamic> json) =>
      fromModel(LearningSessionModel.fromJson(json));

  static LearningSession fromModel(LearningSessionModel model) {
    final type = _parseType(model.type);
    return LearningSession(
      id: model.id,
      type: type,
      status: _parseStatus(model.status),
      itemCount: model.itemCount,
      title: model.title,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      activeDocumentCount: model.activeDocumentCount,
      sourceChatId: model.sourceChatId,
      items: model.items
          .map((item) => itemFromModel(item, type))
          .toList(growable: false),
    );
  }

  static Map<String, dynamic> generateRequestToJson(
    GenerateLearningSessionRequest request,
  ) {
    return {
      'type': request.type.name,
      if (request.itemCount != null) 'itemCount': request.itemCount,
      if (request.sourceChatId != null) 'sourceChatId': request.sourceChatId,
    };
  }

  static LearningSessionItem itemFromModel(
    LearningSessionItemModel model,
    LearningSessionType type,
  ) {
    return LearningSessionItem(
      id: model.id,
      sources: model.sources.map(sourceFromModel).toList(growable: false),
      question: model.question,
      choices: model.choices,
      correctIndex: model.correctIndex,
      explanation: model.explanation,
      front: model.front,
      back: model.back,
    );
  }

  static LearningSessionSource sourceFromModel(
    LearningSessionSourceModel model,
  ) {
    return LearningSessionSource(
      chunkId: model.chunkId,
      documentId: model.documentId,
      title: model.title,
      excerpt: model.excerpt,
      pageStart: model.pageStart,
      pageEnd: model.pageEnd,
    );
  }

  static LearningSessionType _parseType(String value) {
    return LearningSessionType.values.firstWhere(
      (type) => type.name == value,
      orElse: () => throw FormatException('Unknown learning session type: $value'),
    );
  }

  static LearningSessionStatus _parseStatus(String value) {
    return LearningSessionStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () =>
          throw FormatException('Unknown learning session status: $value'),
    );
  }
}
