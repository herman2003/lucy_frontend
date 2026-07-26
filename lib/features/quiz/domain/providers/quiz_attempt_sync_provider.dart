import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../data/datasources/quiz_attempt_api_remote_data_source.dart';
import '../../services/quiz_attempt_sync_service.dart';

part 'quiz_attempt_sync_provider.g.dart';

@Riverpod(keepAlive: true)
QuizAttemptApiRemoteDataSource quizAttemptApiRemoteDataSource(Ref ref) {
  return QuizAttemptApiRemoteDataSource(
    ref.watch(lucyDioClientProvider).dio,
  );
}

@Riverpod(keepAlive: true)
QuizAttemptSyncService quizAttemptSyncService(Ref ref) {
  return QuizAttemptSyncService(
    remoteDataSource: ref.watch(quizAttemptApiRemoteDataSourceProvider),
  );
}
