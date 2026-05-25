/// Backend profile API failure mapped for [AuthRepositoryImpl].
class AuthProfileApiException implements Exception {
  const AuthProfileApiException(this.code);

  final String code;
}
