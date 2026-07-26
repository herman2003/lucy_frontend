import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/exceptions/chat_exception.dart';

/// Downloads the J-N revision calendar `.ics` file for a chat thread.
class RevisionCalendarRemoteDataSource {
  RevisionCalendarRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<int>> downloadIcs(String chatId) async {
    try {
      final response = await _dio.get<List<int>>(
        ApiEndpoints.chatRevisionCalendarIcs(chatId),
        options: Options(responseType: ResponseType.bytes),
      );
      final data = response.data;
      if (data == null || data.isEmpty) {
        throw const ChatException('VALIDATION_ERROR');
      }
      return data;
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  ChatException _mapDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final code = data['error'];
      if (code is String && code.isNotEmpty) {
        return ChatException(code, statusCode: error.response?.statusCode);
      }
    }
    return ChatException(
      'INTERNAL_ERROR',
      statusCode: error.response?.statusCode,
    );
  }
}
