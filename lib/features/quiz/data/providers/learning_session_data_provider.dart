import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../domain/repositories/learning_session_repository.dart';
import '../datasources/learning_session_api_remote_data_source.dart';
import '../repositories/learning_session_repository_impl.dart';

part 'learning_session_data_provider.g.dart';

@Riverpod(keepAlive: true)
LearningSessionApiRemoteDataSource learningSessionApiRemoteDataSource(Ref ref) {
  return LearningSessionApiRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
LearningSessionRepository learningSessionRepositoryImpl(Ref ref) {
  return LearningSessionRepositoryImpl(
    ref.watch(learningSessionApiRemoteDataSourceProvider),
  );
}
