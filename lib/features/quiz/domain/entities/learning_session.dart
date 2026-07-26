import 'learning_session_item.dart';
import 'learning_session_status.dart';
import 'learning_session_type.dart';

class LearningSession {
  const LearningSession({
    required this.id,
    required this.type,
    required this.status,
    required this.itemCount,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.activeDocumentCount,
    required this.items,
    this.sourceChatId,
  });

  final String id;
  final LearningSessionType type;
  final LearningSessionStatus status;
  final int itemCount;
  final String title;
  final String createdAt;
  final String updatedAt;
  final int activeDocumentCount;
  final String? sourceChatId;
  final List<LearningSessionItem> items;
}
