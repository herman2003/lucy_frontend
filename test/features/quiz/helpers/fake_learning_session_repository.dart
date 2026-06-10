import 'package:lucy_frontend/features/quiz/domain/entities/generate_learning_session_request.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session.dart';
import 'package:lucy_frontend/features/quiz/domain/entities/learning_session_list_item.dart';
import 'package:lucy_frontend/features/quiz/domain/repositories/learning_session_repository.dart';

class FakeLearningSessionRepository implements LearningSessionRepository {
  FakeLearningSessionRepository({LearningSession? session}) : _session = session;

  LearningSession? _session;
  List<LearningSessionListItem> _sessions = const [];
  GenerateLearningSessionRequest? lastGenerateRequest;
  String? lastGetById;

  void setSession(LearningSession session) {
    _session = session;
  }

  void setSessions(List<LearningSessionListItem> sessions) {
    _sessions = sessions;
  }

  @override
  Future<LearningSession> generate(GenerateLearningSessionRequest request) async {
    lastGenerateRequest = request;
    if (_session == null) {
      throw StateError('FakeLearningSessionRepository session not set');
    }
    return _session!;
  }

  @override
  Future<LearningSession> getById(String sessionId) async {
    lastGetById = sessionId;
    if (_session == null || _session!.id != sessionId) {
      throw StateError('FakeLearningSessionRepository session not found');
    }
    return _session!;
  }

  @override
  Future<List<LearningSessionListItem>> list() async => _sessions;
}
