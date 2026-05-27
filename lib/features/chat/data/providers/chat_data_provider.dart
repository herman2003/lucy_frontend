import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_api_remote_data_source.dart';
import '../repositories/chat_repository_impl.dart';

part 'chat_data_provider.g.dart';

@Riverpod(keepAlive: true)
ChatApiRemoteDataSource chatApiRemoteDataSource(Ref ref) {
  return ChatApiRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
ChatRepository chatRepositoryImpl(Ref ref) {
  return ChatRepositoryImpl(ref.watch(chatApiRemoteDataSourceProvider));
}
