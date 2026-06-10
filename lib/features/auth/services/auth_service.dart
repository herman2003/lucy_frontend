import '../domain/entities/auth_user.dart';
import '../domain/repositories/auth_repository.dart';

/// Authentication business facade (UI → Notifier → Service → Repository).
class AuthService {
  AuthService({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

  AuthUser? get currentUser => _repository.currentUser;

  Stream<AuthUser?> authStateChanges() => _repository.authStateChanges();

  Future<AuthUser> loginWithEmail({
    required String email,
    required String password,
  }) {
    return _repository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthUser> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
  }) {
    return _repository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      fullName: fullName,
    );
  }

  Future<void> sendPasswordResetEmail({required String email}) {
    return _repository.sendPasswordResetEmail(email: email);
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    return _repository.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  Future<void> signOut() => _repository.signOut();
}
