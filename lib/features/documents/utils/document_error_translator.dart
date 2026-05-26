import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../domain/exceptions/document_exception.dart';

/// Maps Lucy documents API error codes to l10n (spec §4.2).
abstract final class DocumentErrorTranslator {
  DocumentErrorTranslator._();

  static String translate(BuildContext context, String code) {
    final l10n = context.l10n;

    return switch (code) {
      'VALIDATION_ERROR' => l10n.documentErrorValidation,
      'UNAUTHORIZED' => l10n.documentErrorUnauthorized,
      'DOCUMENT_UPLOAD_NOT_READY' => l10n.documentErrorUploadNotReady,
      'DOCUMENT_PROCESSING_IN_PROGRESS' => l10n.documentErrorProcessingNoDelete,
      'DOCUMENT_UPLOAD_IN_PROGRESS' => l10n.documentErrorOneUploadAtATime,
      'SEARCH_ACTIVE_LIMIT_EXCEEDED' => l10n.documentErrorSearchActiveLimit,
      'DOCUMENT_TYPE_NOT_ALLOWED' => l10n.documentErrorTypeNotAllowed,
      'DOCUMENT_TYPE_MISMATCH' => l10n.documentErrorTypeMismatch,
      'DOCUMENT_TOO_LARGE' => l10n.documentErrorTooLarge,
      'DOCUMENT_EMPTY_EXTRACTION' => l10n.documentErrorEmptyExtraction,
      'DOCUMENT_PASSWORD_PROTECTED' => l10n.documentErrorPasswordProtected,
      'DOCUMENT_OCR_REQUIRED' => l10n.documentErrorOcrRequired,
      'DOCUMENT_NOT_FOUND' => l10n.documentErrorNotFound,
      'DOCUMENT_PROCESSING_FAILED' => l10n.documentProcessingFailed,
      'UPLOAD_ABANDONED' => l10n.documentErrorUploadAbandoned,
      'LLM_UNAVAILABLE' => l10n.documentErrorEmbeddingUnavailable,
      _ => l10n.documentGenericError,
    };
  }

  static String fromException(BuildContext context, Object error) {
    if (error is DocumentException) {
      return translate(context, error.code);
    }
    return context.l10n.documentGenericError;
  }
}
