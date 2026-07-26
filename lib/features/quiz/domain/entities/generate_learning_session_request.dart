import 'learning_session_type.dart';

class GenerateLearningSessionRequest {
  const GenerateLearningSessionRequest({
    required this.type,
    this.itemCount,
    this.sourceChatId,
  });

  final LearningSessionType type;
  final int? itemCount;
  final String? sourceChatId;
}
