import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/quiz_attempt.dart';
import '../../domain/exceptions/learning_session_exception.dart';

/// Remote port for quiz attempt history (LEARN-12b-V2).
abstract class QuizAttemptRemotePort {
  Future<void> createAttempt({
    required String sessionId,
    required QuizAttempt attempt,
  });

  Future<List<QuizAttempt>> listAttempts(String sessionId);
}

/// Remote API for quiz attempt history (LEARN-12b-V2).
class QuizAttemptApiRemoteDataSource implements QuizAttemptRemotePort {
  QuizAttemptApiRemoteDataSource(this._dio);

  final Dio _dio;

  Future<void> createAttempt({
    required String sessionId,
    required QuizAttempt attempt,
  }) async {
    try {
      await _dio.post<void>(
        ApiEndpoints.learningSessionAttempts(sessionId),
        data: _attemptBody(attempt),
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<List<QuizAttempt>> listAttempts(String sessionId) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiEndpoints.learningSessionAttempts(sessionId),
      );
      final data = response.data;
      if (data == null) {
        throw const LearningSessionException('INTERNAL_ERROR');
      }
      return [
        for (final entry in data)
          if (entry is Map<String, dynamic>)
            QuizAttempt.fromJson(entry),
      ];
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Map<String, dynamic> _attemptBody(QuizAttempt attempt) {
    final json = attempt.toJson();
    json.remove('sessionId');
    return json;
  }

  LearningSessionException _mapDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final code = data['error'];
      if (code is String && code.isNotEmpty) {
        return LearningSessionException(
          code,
          statusCode: error.response?.statusCode,
        );
      }
    }
    return LearningSessionException(
      'INTERNAL_ERROR',
      statusCode: error.response?.statusCode,
    );
  }
}
