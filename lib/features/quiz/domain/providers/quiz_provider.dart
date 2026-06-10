import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/quiz_data_provider.dart';
import '../../services/quiz_service.dart';
import '../repositories/quiz_repository.dart';

part 'quiz_provider.g.dart';

@Riverpod(keepAlive: true)
QuizRepository quizRepository(Ref ref) {
  return ref.watch(quizRepositoryImplProvider);
}

@Riverpod(keepAlive: true)
QuizService quizService(Ref ref) {
  return QuizService(repository: ref.watch(quizRepositoryProvider));
}
