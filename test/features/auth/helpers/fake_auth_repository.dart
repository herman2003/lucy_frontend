import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';

/// In-memory [AuthRepository] for widget/router tests.
class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this._user);

  AuthUser? _user;

  @override
  AuthUser? get currentUser => _user;

  @override
  Stream<AuthUser?> authStateChanges() async* {
    yield _user;
  }

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _user = AuthUser(uid: 'uid', email: email);
    return _user!;
  }

  @override
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    _user = AuthUser(uid: 'uid', email: email, displayName: fullName);
    return _user!;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {}

  @override
  Future<void> signOut() async {
    _user = null;
  }
}
