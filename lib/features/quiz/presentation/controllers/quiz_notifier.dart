import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/exceptions/learning_session_exception.dart';
import '../../domain/exceptions/quiz_exception.dart';
import '../../domain/providers/learning_session_provider.dart';
import '../../domain/providers/quiz_provider.dart';
import 'quiz_state.dart';

part 'quiz_notifier.g.dart';

@riverpod
class QuizNotifier extends _$QuizNotifier {
  @override
  QuizState build() => const QuizState();

  Future<void> bootstrap() async {
    state = state.copyWith(isLoading: true, errorCode: null);
    try {
      final eligibility = await ref.read(quizServiceProvider).getEligibility();
      final sessions = await ref.read(learningSessionServiceProvider).list();
      state = state.copyWith(
        isLoading: false,
        eligibility: eligibility,
        sessions: sessions,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, errorCode: _errorCode(error));
    }
  }

  String _errorCode(Object error) {
    if (error is QuizException) {
      return error.code;
    }
    if (error is LearningSessionException) {
      return error.code;
    }
    return 'INTERNAL_ERROR';
  }
}
