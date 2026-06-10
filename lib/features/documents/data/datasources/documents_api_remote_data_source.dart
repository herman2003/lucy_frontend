import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/document_complete_result.dart';
import '../../domain/entities/document_download_result.dart';
import '../../domain/exceptions/document_exception.dart';
import '../models/create_document_response_model.dart';
import '../models/document_model.dart';

/// Nest `/v1/documents` HTTP API (Bearer via shared [Dio] interceptor).
class DocumentsApiRemoteDataSource {
  DocumentsApiRemoteDataSource(this._dio, {Dio? uploadClient})
    : _uploadClient = uploadClient ?? Dio();

  final Dio _dio;
  final Dio _uploadClient;

  Future<CreateDocumentResponseModel> createDocument({
    required String title,
    required String fileName,
    required String mimeType,
    required int byteSize,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.documents,
        data: {
          'title': title,
          'fileName': fileName,
          'mimeType': mimeType,
          'byteSize': byteSize,
        },
      );
      final data = response.data;
      if (data == null) {
        throw const DocumentException('INTERNAL_ERROR');
      }
      return CreateDocumentResponseModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<List<DocumentModel>> listDocuments() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiEndpoints.documents);
      final data = response.data;
      if (data == null) {
        return [];
      }
      return data
          .whereType<Map<String, dynamic>>()
          .map(DocumentModel.fromJson)
          .toList();
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<DocumentModel> getDocument(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.document(id),
      );
      final data = response.data;
      if (data == null) {
        throw const DocumentException('DOCUMENT_NOT_FOUND');
      }
      return DocumentModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<void> deleteDocument(String id) async {
    try {
      await _dio.delete<void>(ApiEndpoints.document(id));
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<DocumentCompleteResult> reprocessDocument(String id) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.documentReprocess(id),
      );
      final data = response.data;
      if (data == null) {
        throw const DocumentException('INTERNAL_ERROR');
      }
      return DocumentCompleteResult(
        id: data['id'] as String? ?? id,
        status: data['status'] as String? ?? 'processing',
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<DocumentCompleteResult> completeDocument(String id) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.documentComplete(id),
      );
      final data = response.data;
      if (data == null) {
        throw const DocumentException('INTERNAL_ERROR');
      }
      return DocumentCompleteResult(
        id: data['id'] as String? ?? id,
        status: data['status'] as String? ?? 'processing',
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<DocumentModel> patchSearchEnabled({
    required String id,
    required bool searchEnabled,
  }) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiEndpoints.document(id),
        data: {'searchEnabled': searchEnabled},
      );
      final data = response.data;
      if (data == null) {
        throw const DocumentException('INTERNAL_ERROR');
      }
      return DocumentModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<DocumentDownloadResult> getDownloadUrl(String id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.documentDownload(id),
      );
      final data = response.data;
      if (data == null) {
        throw const DocumentException('DOCUMENT_NOT_FOUND');
      }
      return DocumentDownloadResult(
        downloadUrl: data['downloadUrl'] as String,
        expiresAt: data['expiresAt'] as String,
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  /// Multipart upload via Nest (Flutter web — avoids R2 bucket CORS).
  Future<void> uploadDocumentFile({
    required String documentId,
    required List<int> bytes,
    required String mimeType,
    required String fileName,
  }) async {
    try {
      await _dio.post<void>(
        ApiEndpoints.documentUpload(documentId),
        data: FormData.fromMap({
          'file': MultipartFile.fromBytes(bytes, filename: fileName),
        }),
        options: Options(
          validateStatus: (status) =>
              status != null && status >= 200 && status < 300,
        ),
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  /// PUT binary to signed storage URL (mobile/desktop).
  Future<void> uploadBinary({
    required String uploadUrl,
    required List<int> bytes,
    required String mimeType,
  }) async {
    try {
      await _uploadClient.put<void>(
        uploadUrl,
        data: bytes,
        options: Options(
          headers: {'Content-Type': mimeType},
          validateStatus: (status) => status != null && status < 400,
        ),
      );
    } on DioException catch (error) {
      final status = error.response?.statusCode;
      final isNetworkOrCors =
          status == null &&
          (error.type == DioExceptionType.connectionError ||
              error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.unknown);
      throw DocumentException(
        isNetworkOrCors
            ? 'DOCUMENT_UPLOAD_NETWORK'
            : 'DOCUMENT_UPLOAD_NOT_READY',
        statusCode: status,
      );
    }
  }

  DocumentException _mapDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final code = data['error'];
      if (code is String && code.isNotEmpty) {
        return DocumentException(code, statusCode: error.response?.statusCode);
      }
    }
    return DocumentException(
      'INTERNAL_ERROR',
      statusCode: error.response?.statusCode,
    );
  }
}
