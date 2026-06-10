import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/exceptions/quiz_exception.dart';
import '../models/quiz_eligibility_model.dart';

class QuizApiRemoteDataSource {
  QuizApiRemoteDataSource(this._dio);

  final Dio _dio;

  Future<QuizEligibilityModel> getEligibility() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.quizEligibility,
      );
      final data = response.data;
      if (data == null) {
        throw const QuizException('INTERNAL_ERROR');
      }
      return QuizEligibilityModel.fromJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  QuizException _mapDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final code = data['error'];
      if (code is String && code.isNotEmpty) {
        return QuizException(code, statusCode: error.response?.statusCode);
      }
    }
    return QuizException(
      'INTERNAL_ERROR',
      statusCode: error.response?.statusCode,
    );
  }
}
