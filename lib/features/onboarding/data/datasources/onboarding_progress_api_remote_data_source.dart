import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../domain/entities/onboarding_resume_progress.dart';
import '../../domain/exceptions/onboarding_exception.dart';
import '../mappers/onboarding_progress_mapper.dart';

/// Nest `GET /v1/onboarding/progress` — onboarding resume (centralization C-F2).
class OnboardingProgressApiRemoteDataSource {
  OnboardingProgressApiRemoteDataSource(this._dio);

  final Dio _dio;

  Future<OnboardingResumeProgress?> fetchProgress({required String uid}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.onboardingProgress,
      );
      return OnboardingProgressMapper.fromApiJson(response.data ?? {});
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
