import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/generate_learning_session_request.dart';
import '../../domain/exceptions/learning_session_exception.dart';
import '../mappers/learning_session_mapper.dart';
import '../models/learning_session_list_item_model.dart';
import '../models/learning_session_model.dart';

class LearningSessionApiRemoteDataSource {
  LearningSessionApiRemoteDataSource(this._dio);

  final Dio _dio;

  Future<LearningSessionModel> generate(
    GenerateLearningSessionRequest request,
  ) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.learningSessionsGenerate,
        data: LearningSessionMapper.generateRequestToJson(request),
      );
      final data = response.data;
      if (data == null) {
        throw const LearningSessionException('INTERNAL_ERROR');
      }
      return LearningSessionModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<LearningSessionModel> getById(String sessionId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.learningSession(sessionId),
      );
      final data = response.data;
      if (data == null) {
        throw const LearningSessionException('INTERNAL_ERROR');
      }
      return LearningSessionModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<List<LearningSessionListItemModel>> list() async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiEndpoints.learningSessions,
      );
      final data = response.data;
      if (data == null) {
        throw const LearningSessionException('INTERNAL_ERROR');
      }
      return data
          .map(
            (entry) => LearningSessionListItemModel.fromJson(
              entry as Map<String, dynamic>,
            ),
          )
          .toList(growable: false);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
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
