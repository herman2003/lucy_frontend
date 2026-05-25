import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/providers/onboarding_data_provider.dart';
import '../../services/onboarding_service.dart';
import '../repositories/onboarding_repository.dart';

part 'onboarding_provider.g.dart';

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepository(Ref ref) {
  return ref.watch(onboardingRepositoryImplProvider);
}

@Riverpod(keepAlive: true)
OnboardingService onboardingService(Ref ref) {
  return OnboardingService(repository: ref.watch(onboardingRepositoryProvider));
}
