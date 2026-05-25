import 'auth_user_snapshot.dart';

/// Contract for Firebase Authentication operations (data layer).
abstract class AuthRemoteDataSource {
  AuthUserSnapshot? get currentUser;

  Stream<AuthUserSnapshot?> authStateChanges();

  Future<AuthUserSnapshot> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AuthUserSnapshot> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> updateDisplayName({
    required String uid,
    required String displayName,
  });

  Future<void> deleteCurrentUser();

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> signOut();

  /// Firebase ID token for backend `Authorization` header (SPEC §4.7).
  Future<String?> getIdToken({bool forceRefresh = false});
}
