import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/lucy_dio_client.dart';
import '../../../auth/domain/providers/auth_provider.dart';
import '../../domain/repositories/onboarding_progress_repository.dart';
import '../../domain/repositories/onboarding_repository.dart';
import '../datasources/onboarding_analyze_remote_data_source.dart';
import '../datasources/onboarding_confirm_remote_data_source.dart';
import '../datasources/onboarding_finalize_remote_data_source.dart';
import '../datasources/onboarding_local_draft_prefs_data_source.dart';
import '../datasources/onboarding_progress_api_remote_data_source.dart';
import '../datasources/onboarding_validate_remote_data_source.dart';
import '../repositories/onboarding_local_draft_repository_impl.dart';
import '../repositories/onboarding_progress_repository_impl.dart';
import '../repositories/onboarding_repository_impl.dart';
import '../../domain/repositories/onboarding_local_draft_repository.dart';

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
OnboardingConfirmRemoteDataSource onboardingConfirmRemoteDataSource(
  Ref ref,
) {
  return OnboardingConfirmRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
OnboardingAnalyzeRemoteDataSource onboardingAnalyzeRemoteDataSource(
  Ref ref,
) {
  return OnboardingAnalyzeRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
OnboardingFinalizeRemoteDataSource onboardingFinalizeRemoteDataSource(
  Ref ref,
) {
  return OnboardingFinalizeRemoteDataSource(ref.watch(lucyDioClientProvider).dio);
}

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepositoryImpl(Ref ref) {
  return OnboardingRepositoryImpl(
    validateRemote: ref.watch(onboardingValidateRemoteDataSourceProvider),
    confirmRemote: ref.watch(onboardingConfirmRemoteDataSourceProvider),
    analyzeRemote: ref.watch(onboardingAnalyzeRemoteDataSourceProvider),
    finalizeRemote: ref.watch(onboardingFinalizeRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
OnboardingProgressApiRemoteDataSource onboardingProgressApiRemoteDataSource(
  Ref ref,
) {
  return OnboardingProgressApiRemoteDataSource(
    ref.watch(lucyDioClientProvider).dio,
  );
}

@Riverpod(keepAlive: true)
OnboardingProgressRepository onboardingProgressRepositoryImpl(Ref ref) {
  return OnboardingProgressRepositoryImpl(
    ref.watch(onboardingProgressApiRemoteDataSourceProvider),
  );
}

@Riverpod(keepAlive: true)
OnboardingLocalDraftRepository onboardingLocalDraftRepositoryImpl(Ref ref) {
  return OnboardingLocalDraftRepositoryImpl(
    OnboardingLocalDraftPrefsDataSource(),
  );
}
