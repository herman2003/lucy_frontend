import 'auth_user.dart';

/// Auth bootstrap payload for routing (SPEC §4.7 F03).
class AuthBootstrapResult {
  const AuthBootstrapResult({this.user, this.isConfigured = false});

  final AuthUser? user;
  final bool isConfigured;
}
