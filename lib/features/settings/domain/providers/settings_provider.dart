import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../onboarding/data/providers/onboarding_data_provider.dart';
import '../../data/datasources/settings_api_remote_data_source.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../services/settings_service.dart';

part 'settings_provider.g.dart';

@Riverpod(keepAlive: true)
SettingsApiRemoteDataSource settingsApiRemoteDataSource(Ref ref) {
  return SettingsApiRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) {
  return SettingsRepositoryImpl(ref.watch(settingsApiRemoteDataSourceProvider));
}

@Riverpod(keepAlive: true)
SettingsService settingsService(Ref ref) {
  return SettingsService(repository: ref.watch(settingsRepositoryProvider));
}
