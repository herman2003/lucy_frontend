import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../dtos/user_profile_dto.dart';
import '../exceptions/auth_profile_api_exception.dart';
import '../mappers/user_profile_mapper.dart';
import 'user_profile_remote_data_source.dart';

/// Nest `GET/POST /v1/users/me` — profile reads/writes (centralization C-F1).
class UserProfileApiRemoteDataSource implements UserProfileRemoteDataSource {
  UserProfileApiRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<void> createUserProfile({
    required String uid,
    required UserProfileDto profile,
  }) async {
    try {
      await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.usersMe,
        data: {'fullName': profile.fullName, 'email': profile.email},
      );
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  @override
  Future<UserProfileDto?> fetchUserProfile({required String uid}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.usersMe,
      );
      final data = response.data;
      if (data == null) {
        return null;
      }
      return UserProfileMapper.fromApiJson(data);
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  AuthProfileApiException _mapDioError(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final code = data['error'];
      if (code == 'USER_PROFILE_CONFLICT') {
        return const AuthProfileApiException('user-profile-conflict');
      }
    }
    return const AuthProfileApiException('profile-write-failed');
  }
}
