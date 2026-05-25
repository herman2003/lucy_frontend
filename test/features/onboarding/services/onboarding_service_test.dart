import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/onboarding/domain/entities/finalize_onboarding_result.dart';
import 'package:frontend/features/onboarding/services/onboarding_service.dart';

import '../helpers/fake_onboarding_repository.dart';

void main() {
  test('finalizeOnboarding delegates to repository', () async {
    var called = false;
    final repository = FakeOnboardingRepository(
      finalizeHandler: () async {
        called = true;
        return const FinalizeOnboardingResult();
      },
    );
    final service = OnboardingService(repository: repository);

    final result = await service.finalizeOnboarding();

    expect(called, isTrue);
    expect(result.isConfigured, isTrue);
    expect(repository.finalizeCallCount, 1);
  });
}
