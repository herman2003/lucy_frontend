import '../../domain/entities/auth_user.dart';
import '../../domain/exceptions/auth_exception.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/user_profile_remote_data_source.dart';
import '../dtos/user_profile_dto.dart';
import '../exceptions/firebase_auth_data_exception.dart';
import '../exceptions/auth_profile_api_exception.dart';
import '../mappers/auth_user_mapper.dart';

/// Auth repository — orchestrates Firebase Auth + Nest profile API (C-F1).
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource authRemote,
    required UserProfileRemoteDataSource profileRemote,
  }) : _authRemote = authRemote,
       _profileRemote = profileRemote;

  final AuthRemoteDataSource _authRemote;
  final UserProfileRemoteDataSource _profileRemote;

  @override
  AuthUser? get currentUser =>
      AuthUserMapper.fromSnapshotNullable(_authRemote.currentUser);

  @override
  Stream<AuthUser?> authStateChanges() {
    return _authRemote.authStateChanges().map(
      AuthUserMapper.fromSnapshotNullable,
    );
  }

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final snapshot = await _authRemote.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthUserMapper.fromSnapshot(snapshot);
    } on FirebaseAuthDataException catch (e) {
      throw AuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final snapshot = await _authRemote.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _authRemote.updateDisplayName(
        uid: snapshot.uid,
        displayName: fullName,
      );

      final profile = UserProfileDto(
        fullName: fullName,
        email: email,
        createdAt: DateTime.now().toUtc().toIso8601String(),
        isConfigured: false,
      );

      try {
        await _profileRemote.createUserProfile(
          uid: snapshot.uid,
          profile: profile,
        );
      } on AuthProfileApiException catch (e) {
        await _authRemote.deleteCurrentUser();
        throw AuthException(code: e.code);
      } on Object {
        await _authRemote.deleteCurrentUser();
        throw const AuthException(code: 'profile-write-failed');
      }

      final current = _authRemote.currentUser;
      if (current == null) {
        throw const AuthException(code: 'user-not-found');
      }
      return AuthUserMapper.fromSnapshot(current);
    } on FirebaseAuthDataException catch (e) {
      throw AuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _authRemote.sendPasswordResetEmail(email: email);
    } on FirebaseAuthDataException catch (e) {
      throw AuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _authRemote.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } on FirebaseAuthDataException catch (e) {
      throw AuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    await _authRemote.signOut();
  }

  @override
  Future<bool> fetchIsConfiguredForCurrentUser() async {
    final uid = currentUser?.uid;
    if (uid == null) {
      return false;
    }
    try {
      final profile = await _profileRemote.fetchUserProfile(uid: uid);
      return profile?.isConfiguredEffective ?? false;
    } on AuthProfileApiException {
      return false;
    }
  }

  @override
  Future<String?> getIdToken({bool forceRefresh = false}) {
    return _authRemote.getIdToken(forceRefresh: forceRefresh);
  }
}
