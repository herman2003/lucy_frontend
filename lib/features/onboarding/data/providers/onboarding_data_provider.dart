import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/lucy_dio_client.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_validate_remote_data_source.dart';
import '../repositories/onboarding_repository_impl.dart';

part 'onboarding_data_provider.g.dart';

@Riverpod(keepAlive: true)
LucyDioClient lucyDioClient(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LucyDioClient(
    idTokenProvider: ({bool forceRefresh = false}) =>
        authRepository.getIdToken(forceRefresh: forceRefresh),
  );
}

@Riverpod(keepAlive: true)
OnboardingValidateRemoteDataSource onboardingValidateRemoteDataSource(
  Ref ref,
) {
  return OnboardingValidateRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepositoryImpl(Ref ref) {
  return OnboardingRepositoryImpl(
    validateRemote: ref.watch(onboardingValidateRemoteDataSourceProvider),
  );
}
