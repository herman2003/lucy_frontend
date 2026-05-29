import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/onboarding/data/datasources/onboarding_progress_api_remote_data_source.dart';
import 'package:lucy_frontend/features/onboarding/domain/exceptions/onboarding_exception.dart';

void main() {
  group('OnboardingProgressApiRemoteDataSource', () {
    test(
      'fetchProgress GETs onboarding/progress and maps transcript',
      () async {
        late RequestOptions captured;
        final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3001'));
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              captured = options;
              handler.resolve(
                Response<Map<String, dynamic>>(
                  requestOptions: options,
                  statusCode: 200,
                  data: {
                    'onboardingStatus': 'in_progress',
                    'transcript': [
                      {
                        'questionId': 'q_role',
                        'questionText': 'Role?',
                        'answerText': 'Student',
                        'confirmedAt': '2026-05-25T12:00:00.000Z',
                      },
                    ],
                  },
                ),
              );
            },
          ),
        );

        final progress = await OnboardingProgressApiRemoteDataSource(
          dio,
        ).fetchProgress(uid: 'uid-1');

        expect(captured.path, endsWith('/v1/onboarding/progress'));
        expect(captured.method, 'GET');
        expect(progress?.onboardingStatus, 'in_progress');
        expect(progress?.transcript, hasLength(1));
        expect(progress?.transcript.first.questionId, 'q_role');
      },
    );

    test('fetchProgress returns null for not_started empty state', () async {
      final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3001'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.resolve(
              Response<Map<String, dynamic>>(
                requestOptions: options,
                statusCode: 200,
                data: {'onboardingStatus': 'not_started', 'transcript': []},
              ),
            );
          },
        ),
      );

      final progress = await OnboardingProgressApiRemoteDataSource(
        dio,
      ).fetchProgress(uid: 'uid-1');

      expect(progress, isNull);
    });

    test('maps structured API errors to OnboardingException', () async {
      final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3001'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.reject(
              DioException(
                requestOptions: options,
                response: Response(
                  requestOptions: options,
                  statusCode: 500,
                  data: {'error': 'INTERNAL_ERROR', 'message': 'boom'},
                ),
              ),
            );
          },
        ),
      );

      expect(
        OnboardingProgressApiRemoteDataSource(dio).fetchProgress(uid: 'uid-1'),
        throwsA(
          isA<OnboardingException>().having(
            (e) => e.code,
            'code',
            'INTERNAL_ERROR',
          ),
        ),
      );
    });
  });
}
