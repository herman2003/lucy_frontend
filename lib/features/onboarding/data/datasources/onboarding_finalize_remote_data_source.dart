import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/exceptions/onboarding_exception.dart';

/// HTTP access to `POST /v1/onboarding/finalize`.
class OnboardingFinalizeRemoteDataSource {
  OnboardingFinalizeRemoteDataSource(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> finalize() async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.onboardingFinalize,
        data: {'accept': true},
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
