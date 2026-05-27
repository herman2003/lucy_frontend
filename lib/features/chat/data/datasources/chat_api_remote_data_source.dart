import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/exceptions/chat_exception.dart';
import '../models/chat_eligibility_model.dart';
import '../models/chat_message_model.dart';
import '../models/chat_thread_model.dart';

/// Nest `/v1/chats` HTTP API (Bearer via shared [Dio] interceptor).
class ChatApiRemoteDataSource {
  ChatApiRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<ChatThreadModel>> listThreads() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiEndpoints.chats);
      final data = response.data;
      if (data == null) {
        return [];
      }
      return data
          .whereType<Map<String, dynamic>>()
          .map(ChatThreadModel.fromJson)
          .toList();
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<ChatThreadModel> createThread({String? title}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.chats,
        data: title != null ? {'title': title} : <String, dynamic>{},
      );
      final data = response.data;
      if (data == null) {
        throw const ChatException('INTERNAL_ERROR');
      }
      return ChatThreadModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<List<ChatMessageModel>> listMessages(
    String chatId, {
    int limit = 100,
    String? beforeMessageId,
  }) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiEndpoints.chatMessages(chatId),
        queryParameters: {
          'limit': limit,
          ...? (beforeMessageId != null
              ? {'before': beforeMessageId}
              : null),
        },
      );
      final data = response.data;
      if (data == null) {
        return [];
      }
      return data
          .whereType<Map<String, dynamic>>()
          .map(ChatMessageModel.fromJson)
          .toList();
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<ChatEligibilityModel> getEligibility() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.chatEligibility,
      );
      final data = response.data;
      if (data == null) {
        throw const ChatException('INTERNAL_ERROR');
      }
      return ChatEligibilityModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<void> deleteThread(String chatId) async {
    try {
      await _dio.delete<void>(ApiEndpoints.chat(chatId));
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
