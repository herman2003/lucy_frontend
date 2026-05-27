import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../datasources/quiz_api_remote_data_source.dart';
import '../repositories/quiz_repository_impl.dart';

part 'quiz_data_provider.g.dart';

@Riverpod(keepAlive: true)
QuizApiRemoteDataSource quizApiRemoteDataSource(Ref ref) {
  return QuizApiRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
QuizRepository quizRepositoryImpl(Ref ref) {
  return QuizRepositoryImpl(ref.watch(quizApiRemoteDataSourceProvider));
}
