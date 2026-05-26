import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/document.dart';
import '../../domain/entities/document_status.dart';

part 'documents_state.freezed.dart';

@freezed
abstract class DocumentsState with _$DocumentsState {
  const DocumentsState._();

  const factory DocumentsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUploading,
    @Default(<Document>[]) List<Document> documents,
    String? busyDocumentId,
  }) = _DocumentsState;

  bool get hasBlockingUpload =>
      isUploading ||
      documents.any(
        (d) =>
            d.status == DocumentStatus.uploading ||
            d.status == DocumentStatus.processing,
      );

  int get activeSearchCount => documents
      .where((d) => d.status == DocumentStatus.ready && d.searchEnabled)
      .length;

  bool get hasProcessingDocument => documents.any(
        (d) => d.status == DocumentStatus.processing,
      );

  bool get needsProcessingPoll => documents.any(
        (d) =>
            d.status == DocumentStatus.processing ||
            d.status == DocumentStatus.uploading,
      );
}
