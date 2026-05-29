import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/documents/data/datasources/documents_api_remote_data_source.dart';
import 'package:frontend/features/documents/domain/exceptions/document_exception.dart';

void main() {
  group('DocumentsApiRemoteDataSource', () {
    test('createDocument POSTs metadata to /v1/documents', () async {
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
                  'id': 'doc-1',
                  'uploadUrl': 'https://storage.example/upload',
                  'expiresAt': '2026-05-26T11:00:00.000Z',
                },
              ),
            );
          },
        ),
      );

      final dataSource = DocumentsApiRemoteDataSource(dio);
      final result = await dataSource.createDocument(
        title: 'Test',
        fileName: 'a.txt',
        mimeType: 'text/plain',
        byteSize: 100,
      );

      expect(captured.path, endsWith('/v1/documents'));
      expect(captured.method, 'POST');
      expect(captured.data, {
        'title': 'Test',
        'fileName': 'a.txt',
        'mimeType': 'text/plain',
        'byteSize': 100,
      });
      expect(result.id, 'doc-1');
    });

    test('listDocuments GETs /v1/documents', () async {
      final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3001'));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            handler.resolve(
              Response<List<dynamic>>(
                requestOptions: options,
                statusCode: 200,
                data: [
                  {
                    'id': 'doc-1',
                    'title': 'A',
                    'fileName': 'a.txt',
                    'mimeType': 'text/plain',
                    'byteSize': 10,
                    'status': 'ready',
                    'searchEnabled': true,
                    'createdAt': '2026-05-26T10:00:00.000Z',
                    'updatedAt': '2026-05-26T10:00:00.000Z',
                  },
                ],
              ),
            );
          },
        ),
      );

      final list = await DocumentsApiRemoteDataSource(dio).listDocuments();
      expect(list, hasLength(1));
      expect(list.first.title, 'A');
    });

    test('maps DOCUMENT_UPLOAD_IN_PROGRESS to exception code', () async {
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
                    'error': 'DOCUMENT_UPLOAD_IN_PROGRESS',
                    'message': 'busy',
                  },
                ),
              ),
            );
          },
        ),
      );

      expect(
        DocumentsApiRemoteDataSource(dio).createDocument(
          title: 'Test',
          fileName: 'a.txt',
          mimeType: 'text/plain',
          byteSize: 100,
        ),
        throwsA(
          isA<DocumentException>().having(
            (e) => e.code,
            'code',
            'DOCUMENT_UPLOAD_IN_PROGRESS',
          ),
        ),
      );
    });

    test(
      'uploadBinary PUTs bytes to signed URL without Nest baseUrl',
      () async {
        late RequestOptions captured;
        final dio = Dio();
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              captured = options;
              handler.resolve(
                Response(requestOptions: options, statusCode: 200),
              );
            },
          ),
        );

        await DocumentsApiRemoteDataSource(dio, uploadClient: dio).uploadBinary(
          uploadUrl: 'https://storage.googleapis.com/bucket/object',
          bytes: [1, 2, 3],
          mimeType: 'text/plain',
        );

        expect(captured.uri.toString(), contains('storage.googleapis.com'));
        expect(captured.method, 'PUT');
        expect(captured.headers['Content-Type'], 'text/plain');
      },
    );
  });
}
