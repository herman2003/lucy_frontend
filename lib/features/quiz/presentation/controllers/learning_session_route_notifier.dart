import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/learning_session.dart';
import '../../domain/providers/learning_session_provider.dart';

part 'learning_session_route_notifier.g.dart';

@riverpod
Future<LearningSession> learningSessionRoute(Ref ref, String sessionId) async {
  return ref.read(learningSessionServiceProvider).getById(sessionId);
}
