import 'learning_session_status.dart';
import 'learning_session_type.dart';

class LearningSessionListItem {
  const LearningSessionListItem({
    required this.id,
    required this.type,
    required this.status,
    required this.itemCount,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final LearningSessionType type;
  final LearningSessionStatus status;
  final int itemCount;
  final String title;
  final String createdAt;
  final String updatedAt;
}
