import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../domain/exceptions/chat_exception.dart';

/// Maps Lucy chat API error codes to l10n (spec §4.7).
abstract final class ChatErrorTranslator {
  ChatErrorTranslator._();

  static String translate(BuildContext context, String code) {
    final l10n = context.l10n;

    return switch (code) {
      'CHAT_NO_ACTIVE_DOCUMENTS' => l10n.chatErrorNoActiveDocuments,
      'CHAT_LEARNER_PROFILE_MISSING' => l10n.chatErrorLearnerProfileMissing,
      'UNAUTHORIZED' => l10n.chatErrorUnauthorized,
      'CHAT_NOT_FOUND' => l10n.chatErrorNotFound,
      'VALIDATION_ERROR' => l10n.chatErrorInvalidMessage,
      'LLM_UNAVAILABLE' => l10n.chatErrorLlmUnavailable,
      'SERVICE_UNAVAILABLE' => l10n.chatErrorServiceUnavailable,
      'LLM_RESPONSE_INVALID' => l10n.chatErrorInvalidResponse,
      'CHAT_STREAM_IN_PROGRESS' => l10n.chatErrorStreamInProgress,
      'LEARNING_NO_ACTIVE_DOCUMENTS' => l10n.quizNoCorpusMessage,
      'LEARNING_LEARNER_PROFILE_MISSING' => l10n.chatErrorLearnerProfileMissing,
      'LEARNING_GENERATION_FAILED' => l10n.learningSessionGenerationFailed,
      'LEARNING_VALIDATION_ERROR' => l10n.learningSessionValidationError,
      'LEARNING_SESSION_NOT_FOUND' => l10n.learningSessionNotFound,
      _ => l10n.chatGenericError,
    };
  }

  static String fromException(BuildContext context, Object error) {
    if (error is ChatException) {
      return translate(context, error.code);
    }
    return context.l10n.chatGenericError;
  }
}
