/// Firebase Auth user fields isolated in the data layer.
class AuthUserSnapshot {
  const AuthUserSnapshot({
    required this.uid,
    this.email,
    this.displayName,
  });

  final String uid;
  final String? email;
  final String? displayName;
}
