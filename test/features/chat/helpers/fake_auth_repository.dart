import 'package:lucy_frontend/features/auth/domain/entities/auth_user.dart';
import 'package:lucy_frontend/features/auth/domain/repositories/auth_repository.dart';

/// Minimal [AuthRepository] for chat notifier tests.
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({AuthUser? user}) : _user = user;

  AuthUser? _user;

  void setUser(AuthUser? user) => _user = user;

  @override
  AuthUser? get currentUser => _user;

  @override
  Stream<AuthUser?> authStateChanges() => Stream.value(_user);

  @override
  Future<void> sendPasswordResetEmail({required String email}) =>
      throw UnimplementedError();

  @override
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {}

  @override
  Future<bool> fetchIsConfiguredForCurrentUser() async => true;

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) => throw UnimplementedError();

  @override
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) => throw UnimplementedError();

  @override
  Future<void> signOut() async {}

  @override
  Future<String?> getIdToken({bool forceRefresh = false}) async => 'token';
}
