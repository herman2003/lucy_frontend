import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/quiz_attempt_prefs_data_source.dart';
import '../../services/quiz_attempt_service.dart';

part 'quiz_attempt_provider.g.dart';

@Riverpod(keepAlive: true)
QuizAttemptService quizAttemptService(Ref ref) {
  return QuizAttemptService(
    dataSource: QuizAttemptPrefsDataSource(),
  );
}
