import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/learning_session_data_provider.dart';
import '../../services/learning_session_service.dart';
import '../repositories/learning_session_repository.dart';

part 'learning_session_provider.g.dart';

@Riverpod(keepAlive: true)
LearningSessionRepository learningSessionRepository(Ref ref) {
  return ref.watch(learningSessionRepositoryImplProvider);
}

@Riverpod(keepAlive: true)
LearningSessionService learningSessionService(Ref ref) {
  return LearningSessionService(
    repository: ref.watch(learningSessionRepositoryProvider),
  );
}
