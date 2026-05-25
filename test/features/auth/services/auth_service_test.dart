import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/repositories/auth_repository.dart';
import 'package:frontend/features/auth/services/auth_service.dart';

class _FakeAuthRepository implements AuthRepository {
  bool signOutCalled = false;

  @override
  AuthUser? get currentUser => const AuthUser(
    uid: 'uid-1',
    email: 'a@lucy.test',
    displayName: 'A',
  );

  @override
  Stream<AuthUser?> authStateChanges() => Stream.value(currentUser);

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return AuthUser(uid: 'uid-1', email: email);
  }

  @override
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return AuthUser(uid: 'uid-2', email: email, displayName: fullName);
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {}

  @override
  Future<void> signOut() async {
    signOutCalled = true;
  }
}

void main() {
  group('AuthService', () {
    test('delegates signOut to repository', () async {
      final repository = _FakeAuthRepository();
      final service = AuthService(repository: repository);

      await service.signOut();

      expect(repository.signOutCalled, isTrue);
    });

    test('exposes authStateChanges from repository', () async {
      final service = AuthService(repository: _FakeAuthRepository());

      final user = await service.authStateChanges().first;

      expect(user?.email, 'a@lucy.test');
    });
  });
}
