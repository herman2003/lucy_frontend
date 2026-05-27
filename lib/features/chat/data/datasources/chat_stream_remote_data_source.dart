import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/entities/chat_message_role.dart';
import '../../domain/entities/chat_stream_event.dart';
import '../../domain/exceptions/chat_exception.dart';
import '../mappers/chat_mapper.dart';
import '../models/chat_source_model.dart';
import '../utils/chat_sse_parser.dart';

/// Nest chat SSE stream (`POST …/messages/stream`).
class ChatStreamRemoteDataSource {
  ChatStreamRemoteDataSource(this._dio);

  final Dio _dio;

  Stream<ChatStreamEvent> streamMessage(String chatId, String content) async* {
    Response<ResponseBody> response;
    try {
      response = await _dio.post<ResponseBody>(
        ApiEndpoints.chatMessagesStream(chatId),
        data: {'content': content},
        options: Options(
          responseType: ResponseType.stream,
          headers: const {
            'Accept': 'text/event-stream',
            'Content-Type': 'application/json',
          },
        ),
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }

    final body = response.data;
    if (body == null) {
      throw const ChatException('INTERNAL_ERROR');
    }

    final parser = ChatSseParser();
    await for (final chunk in utf8.decoder.bind(body.stream)) {
      for (final raw in parser.feed(chunk)) {
        final mapped = _mapRawEvent(raw);
        if (mapped != null) {
          yield mapped;
        }
      }
    }
  }

  ChatStreamEvent? _mapRawEvent(ChatSseRawEvent raw) {
    final Map<String, dynamic> json;
    try {
      final decoded = jsonDecode(raw.data);
      if (decoded is! Map<String, dynamic>) {
        return null;
      }
      json = decoded;
    } catch (_) {
      return null;
    }

    return switch (raw.event) {
      'user_message' => ChatStreamUserMessageEvent(
        ChatMessage(
          id: json['id'] as String,
          role: ChatMessageRole.user,
          content: json['content'] as String,
          createdAt: json['createdAt'] as String,
        ),
      ),
      'text_delta' => ChatStreamTextDeltaEvent(json['delta'] as String? ?? ''),
      'sources' => ChatStreamSourcesEvent(
        (json['sources'] as List<dynamic>? ?? const [])
            .whereType<Map<String, dynamic>>()
            .map(
              (item) => ChatMapper.sourceFromModel(ChatSourceModel.fromJson(item)),
            )
            .toList(),
      ),
      'done' => ChatStreamDoneEvent(
        userMessageId: json['userMessageId'] as String,
        assistantMessage: ChatMapper.messageFromJson(
          json['assistantMessage'] as Map<String, dynamic>,
        ),
      ),
      'error' => ChatStreamErrorEvent(json['code'] as String? ?? 'INTERNAL_ERROR'),
      _ => null,
    };
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
