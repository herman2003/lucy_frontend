import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/core/network/api_endpoints.dart';

void main() {
  test('baseUrl has no trailing slash', () {
    expect(ApiEndpoints.baseUrl.endsWith('/'), isFalse);
  });

  test('onboardingValidateAnswer is under v1 prefix', () {
    expect(
      ApiEndpoints.onboardingValidateAnswer,
      '${ApiEndpoints.baseUrl}/v1/onboarding/validate-answer',
    );
  });
}
