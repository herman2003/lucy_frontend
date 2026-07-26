import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/flashcard_sm2_prefs_data_source.dart';
import '../../data/datasources/quiz_attempt_prefs_data_source.dart';
import '../../services/flashcard_sm2_service.dart';
import '../../services/learning_reminder_service.dart';
import '../../services/quiz_attempt_service.dart';
import 'flashcard_sm2_provider.dart';
import 'quiz_attempt_provider.dart';

part 'learning_reminder_provider.g.dart';

@Riverpod(keepAlive: true)
LearningReminderService learningReminderService(Ref ref) {
  return LearningReminderService(
    flashcardSm2Service: ref.watch(flashcardSm2ServiceProvider),
    quizAttemptService: ref.watch(quizAttemptServiceProvider),
  );
}
