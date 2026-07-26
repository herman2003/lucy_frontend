import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../domain/exceptions/learning_session_exception.dart';

abstract final class LearningSessionErrorTranslator {
  LearningSessionErrorTranslator._();

  static String translate(BuildContext context, String code) {
    final l10n = context.l10n;

    return switch (code) {
      'LEARNING_NO_ACTIVE_DOCUMENTS' ||
      'QUIZ_NO_ACTIVE_DOCUMENTS' ||
      'CHAT_NO_ACTIVE_DOCUMENTS' => l10n.quizNoCorpusMessage,
      'LEARNING_LEARNER_PROFILE_MISSING' ||
      'QUIZ_LEARNER_PROFILE_MISSING' ||
      'CHAT_LEARNER_PROFILE_MISSING' => l10n.chatErrorLearnerProfileMissing,
      'LEARNING_SESSION_NOT_FOUND' => l10n.learningSessionNotFound,
      'LEARNING_GENERATION_FAILED' => l10n.learningSessionGenerationFailed,
      'LEARNING_VALIDATION_ERROR' => l10n.learningSessionValidationError,
      'UNAUTHORIZED' => l10n.chatErrorUnauthorized,
      _ => l10n.learningGenericError,
    };
  }

  static String fromException(BuildContext context, Object error) {
    if (error is LearningSessionException) {
      return translate(context, error.code);
    }
    return context.l10n.learningGenericError;
  }
}
