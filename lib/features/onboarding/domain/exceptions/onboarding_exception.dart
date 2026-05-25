/// Onboarding API or validation failure with a stable [code] for l10n mapping.
class OnboardingException implements Exception {
  const OnboardingException(this.code, {this.statusCode});

  final String code;
  final int? statusCode;

  @override
  String toString() => 'OnboardingException($code)';
}
