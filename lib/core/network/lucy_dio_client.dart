import 'package:dio/dio.dart';

import 'api_endpoints.dart';

typedef IdTokenProvider = Future<String?> Function({bool forceRefresh});

/// Shared Dio instance for Lucy backend (SPEC §4.7, A20).
class LucyDioClient {
  LucyDioClient({
    required IdTokenProvider idTokenProvider,
    Dio? dio,
  }) : _idTokenProvider = idTokenProvider,
       _dio = dio ?? Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl)) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
      ),
    );
  }

  final IdTokenProvider _idTokenProvider;
  final Dio _dio;

  Dio get dio => _dio;

  Future<void> _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _idTokenProvider();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  Future<void> _onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final alreadyRetried = options.extra['auth_retry'] == true;

    if (err.response?.statusCode == 401 && !alreadyRetried) {
      final token = await _idTokenProvider(forceRefresh: true);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        options.extra['auth_retry'] = true;
        try {
          final response = await _dio.fetch(options);
          return handler.resolve(response);
        } on DioException catch (retryError) {
          return handler.next(retryError);
        }
      }
    }

    handler.next(err);
  }
}
