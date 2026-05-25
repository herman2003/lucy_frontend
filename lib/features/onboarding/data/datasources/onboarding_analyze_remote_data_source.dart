import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/exceptions/onboarding_exception.dart';

/// HTTP access to `POST /v1/onboarding/analyze`.
class OnboardingAnalyzeRemoteDataSource {
  OnboardingAnalyzeRemoteDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> analyze({
    required String locale,
    bool profileReduced = false,
  }) async {
    try {
      final body = <String, dynamic>{'locale': locale};
      if (profileReduced) {
        body['profileReduced'] = true;
      }
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.onboardingAnalyze,
        data: body,
      );
      return response.data ?? {};
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  OnboardingException _mapDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final code = data['error'];
      if (code is String) {
        return OnboardingException(
          code,
          statusCode: error.response?.statusCode,
        );
      }
    }
    return OnboardingException(
      'INTERNAL_ERROR',
      statusCode: error.response?.statusCode,
    );
  }
}
