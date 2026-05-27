import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../domain/exceptions/quiz_exception.dart';

abstract final class QuizErrorTranslator {
  QuizErrorTranslator._();

  static String translate(BuildContext context, String code) {
    final l10n = context.l10n;

    return switch (code) {
      'QUIZ_NO_ACTIVE_DOCUMENTS' ||
      'CHAT_NO_ACTIVE_DOCUMENTS' => l10n.quizNoCorpusMessage,
      'QUIZ_LEARNER_PROFILE_MISSING' ||
      'CHAT_LEARNER_PROFILE_MISSING' => l10n.chatErrorLearnerProfileMissing,
      'UNAUTHORIZED' => l10n.chatErrorUnauthorized,
      _ => l10n.quizGenericError,
    };
  }

  static String fromException(BuildContext context, Object error) {
    if (error is QuizException) {
      return translate(context, error.code);
    }
    return context.l10n.quizGenericError;
  }
}
