/// Auth failure with a stable code for l10n mapping (T05).
class AuthException implements Exception {
  const AuthException({
    required this.code,
    this.message,
  });

  final String code;
  final String? message;

  @override
  String toString() => 'AuthException($code): $message';
}
