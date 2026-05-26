import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../domain/repositories/documents_repository.dart';
import '../datasources/documents_api_remote_data_source.dart';
import '../repositories/documents_repository_impl.dart';

part 'documents_data_provider.g.dart';

@Riverpod(keepAlive: true)
DocumentsApiRemoteDataSource documentsApiRemoteDataSource(Ref ref) {
  return DocumentsApiRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
DocumentsRepository documentsRepositoryImpl(Ref ref) {
  return DocumentsRepositoryImpl(
    ref.watch(documentsApiRemoteDataSourceProvider),
  );
}
