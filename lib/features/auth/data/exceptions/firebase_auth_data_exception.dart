/// Firebase Auth error surfaced from the data layer (no SDK types above data).
class FirebaseAuthDataException implements Exception {
  const FirebaseAuthDataException({
    required this.code,
    this.message,
  });

  final String code;
  final String? message;
}
