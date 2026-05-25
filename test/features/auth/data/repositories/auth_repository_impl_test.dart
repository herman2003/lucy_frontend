import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:frontend/features/auth/data/datasources/auth_user_snapshot.dart';
import 'package:frontend/features/auth/data/datasources/user_profile_remote_data_source.dart';
import 'package:frontend/features/auth/data/dtos/user_profile_dto.dart';
import 'package:frontend/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';
import 'package:frontend/features/auth/domain/exceptions/auth_exception.dart';

class _FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  AuthUserSnapshot? current;
  bool deleteUserCalled = false;

  @override
  AuthUserSnapshot? get currentUser => current;

  @override
  Stream<AuthUserSnapshot?> authStateChanges() =>
      Stream.value(current);

  @override
  Future<AuthUserSnapshot> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    current = AuthUserSnapshot(uid: 'uid-new', email: email);
    return current!;
  }

  @override
  Future<void> deleteCurrentUser() async {
    deleteUserCalled = true;
    current = null;
  }

  @override
  Future<AuthUserSnapshot> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    current = AuthUserSnapshot(
      uid: 'uid-existing',
      email: email,
      displayName: 'Existing',
    );
    return current!;
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {}

  @override
  Future<void> signOut() async {
    current = null;
  }

  @override
  Future<void> updateDisplayName({
    required String uid,
    required String displayName,
  }) async {
    current = AuthUserSnapshot(
      uid: uid,
      email: current?.email,
      displayName: displayName,
    );
  }
}

class _FakeProfileRemoteDataSource implements UserProfileRemoteDataSource {
  bool shouldFail = false;
  UserProfileDto? lastWritten;

  @override
  Future<void> createUserProfile({
    required String uid,
    required UserProfileDto profile,
  }) async {
    if (shouldFail) {
      throw Exception('firestore write failed');
    }
    lastWritten = profile;
  }
}

void main() {
  group('AuthRepositoryImpl', () {
    late _FakeAuthRemoteDataSource authRemote;
    late _FakeProfileRemoteDataSource profileRemote;
    late AuthRepositoryImpl repository;

    setUp(() {
      authRemote = _FakeAuthRemoteDataSource();
      profileRemote = _FakeProfileRemoteDataSource();
      repository = AuthRepositoryImpl(
        authRemote: authRemote,
        profileRemote: profileRemote,
      );
    });

    test('signUp writes profile and returns AuthUser', () async {
      final user = await repository.signUpWithEmailAndPassword(
        email: 'new@lucy.test',
        password: 'password123',
        fullName: 'New User',
      );

      expect(user.uid, 'uid-new');
      expect(user.email, 'new@lucy.test');
      expect(user.displayName, 'New User');
      expect(profileRemote.lastWritten?.fullName, 'New User');
      expect(authRemote.deleteUserCalled, isFalse);
    });

    test('signUp rolls back auth user when Firestore write fails', () async {
      profileRemote.shouldFail = true;

      await expectLater(
        repository.signUpWithEmailAndPassword(
          email: 'fail@lucy.test',
          password: 'password123',
          fullName: 'Fail User',
        ),
        throwsA(
          isA<AuthException>().having(
            (e) => e.code,
            'code',
            'profile-write-failed',
          ),
        ),
      );

      expect(authRemote.deleteUserCalled, isTrue);
      expect(authRemote.currentUser, isNull);
    });

    test('authStateChanges maps snapshots to AuthUser entities', () async {
      authRemote.current = const AuthUserSnapshot(
        uid: 'uid-1',
        email: 'a@lucy.test',
        displayName: 'A',
      );

      final values = await repository.authStateChanges().first;

      expect(
        values,
        const AuthUser(
          uid: 'uid-1',
          email: 'a@lucy.test',
          displayName: 'A',
        ),
      );
    });
  });
}
