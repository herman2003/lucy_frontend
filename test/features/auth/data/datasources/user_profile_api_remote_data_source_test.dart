import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/auth/data/datasources/user_profile_api_remote_data_source.dart';
import 'package:frontend/features/auth/data/dtos/user_profile_dto.dart';
import 'package:frontend/features/auth/data/exceptions/auth_profile_api_exception.dart';

void main() {
  group('UserProfileApiRemoteDataSource', () {
    test('createUserProfile POSTs fullName and email to users/me', () async {
      late RequestOptions captured;
      final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3001'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            captured = options;
            handler.resolve(
              Response<Map<String, dynamic>>(
                requestOptions: options,
                statusCode: 201,
                data: {
                  'uid': 'uid-1',
                  'fullName': 'Jane',
                  'email': 'jane@test.com',
                  'createdAt': '2026-05-25T12:00:00.000Z',
                  'isConfigured': false,
                  'onboardingStatus': 'not_started',
                },
              ),
            );
          },
        ),
      );

      final dataSource = UserProfileApiRemoteDataSource(dio);
      await dataSource.createUserProfile(
        uid: 'uid-1',
        profile: const UserProfileDto(
          fullName: 'Jane',
          email: 'jane@test.com',
          createdAt: '2026-05-25T12:00:00.000Z',
        ),
      );

      expect(captured.path, endsWith('/v1/users/me'));
      expect(captured.method, 'POST');
      expect(captured.data, {'fullName': 'Jane', 'email': 'jane@test.com'});
    });

    test('fetchUserProfile maps GET response to UserProfileDto', () async {
      final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3001'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.resolve(
              Response<Map<String, dynamic>>(
                requestOptions: options,
                statusCode: 200,
                data: {
                  'uid': 'uid-1',
                  'fullName': 'Jane',
                  'email': 'jane@test.com',
                  'createdAt': '2026-05-25T12:00:00.000Z',
                  'isConfigured': true,
                  'onboardingStatus': 'completed',
                },
              ),
            );
          },
        ),
      );

      final profile = await UserProfileApiRemoteDataSource(
        dio,
      ).fetchUserProfile(uid: 'uid-1');

      expect(profile?.isConfigured, isTrue);
      expect(profile?.fullName, 'Jane');
    });

    test('maps USER_PROFILE_CONFLICT to user-profile-conflict', () async {
      final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3001'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.reject(
              DioException(
                requestOptions: options,
                response: Response(
                  requestOptions: options,
                  statusCode: 409,
                  data: {
                    'error': 'USER_PROFILE_CONFLICT',
                    'message': 'conflict',
                  },
                ),
              ),
            );
          },
        ),
      );

      expect(
        UserProfileApiRemoteDataSource(dio).createUserProfile(
          uid: 'uid-1',
          profile: const UserProfileDto(
            fullName: 'Jane',
            email: 'jane@test.com',
            createdAt: '2026-05-25T12:00:00.000Z',
          ),
        ),
        throwsA(
          isA<AuthProfileApiException>().having(
            (e) => e.code,
            'code',
            'user-profile-conflict',
          ),
        ),
      );
    });
  });
}
