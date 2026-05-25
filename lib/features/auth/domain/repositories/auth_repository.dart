import '../entities/auth_user.dart';

/// Authentication repository contract (domain layer).
abstract class AuthRepository {
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  });

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> signOut();

  Stream<AuthUser?> authStateChanges();

  AuthUser? get currentUser;

  /// Reads `isConfigured` from Firestore profile; false if missing (SPEC §4.4).
  Future<bool> fetchIsConfiguredForCurrentUser();
}
