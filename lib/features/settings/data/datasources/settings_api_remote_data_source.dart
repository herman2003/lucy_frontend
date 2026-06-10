import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../onboarding/data/mappers/learner_profile_api_mapper.dart';
import '../../../onboarding/domain/entities/learner_profile.dart';
import '../mappers/settings_profile_mapper.dart';
import '../../domain/entities/settings_profile.dart';
import '../../domain/exceptions/settings_exception.dart';

/// Nest `GET /v1/users/me` for the settings screen.
class SettingsApiRemoteDataSource {
  SettingsApiRemoteDataSource(this._dio);

  final Dio _dio;

  Future<SettingsProfile> fetchProfile() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.usersMe,
      );
      final data = response.data;
      if (data == null) {
        throw const SettingsException('INTERNAL_ERROR');
      }
      return SettingsProfileMapper.fromApiJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<SettingsProfile> updateAccount({
    String? fullName,
    String? uiLocale,
  }) async {
    final data = <String, dynamic>{};
    if (fullName != null) {
      data['fullName'] = fullName;
    }
    if (uiLocale != null) {
      data['uiLocale'] = uiLocale;
    }
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiEndpoints.usersMe,
        data: data,
      );
      final body = response.data;
      if (body == null) {
        throw const SettingsException('INTERNAL_ERROR');
      }
      return SettingsProfileMapper.fromApiJson(body);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<SettingsProfile> updateLearnerProfile(LearnerProfile profile) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiEndpoints.usersMeLearnerProfile,
        data: LearnerProfileApiMapper.toApiJson(profile),
      );
      final data = response.data;
      if (data == null) {
        throw const SettingsException('INTERNAL_ERROR');
      }
      return SettingsProfileMapper.fromApiJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  SettingsException _mapDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final code = data['error'];
      if (code is String && code.isNotEmpty) {
        return SettingsException(code, statusCode: error.response?.statusCode);
      }
    }
    return SettingsException(
      'INTERNAL_ERROR',
      statusCode: error.response?.statusCode,
    );
  }
}
