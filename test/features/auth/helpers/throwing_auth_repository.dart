import 'package:lucy_frontend/features/auth/domain/entities/auth_user.dart';
import 'package:lucy_frontend/features/auth/domain/exceptions/auth_exception.dart';
import 'package:lucy_frontend/features/auth/domain/repositories/auth_repository.dart';

/// [AuthRepository] that always fails sign-in for notifier tests.
class ThrowingAuthRepository implements AuthRepository {
  ThrowingAuthRepository(this.error);

  final AuthException error;

  @override
  AuthUser? get currentUser => null;

  @override
  Stream<AuthUser?> authStateChanges() => Stream.value(null);

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    throw error;
  }

  @override
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    throw error;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {}

  @override
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    throw error;
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<bool> fetchIsConfiguredForCurrentUser() async => false;

  @override
  Future<String?> getIdToken({bool forceRefresh = false}) async => null;
}
