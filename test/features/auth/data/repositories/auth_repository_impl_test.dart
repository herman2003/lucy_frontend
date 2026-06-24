import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/auth/data/exceptions/auth_profile_api_exception.dart';
import 'package:lucy_frontend/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lucy_frontend/features/auth/data/datasources/auth_user_snapshot.dart';
import 'package:lucy_frontend/features/auth/data/datasources/user_profile_remote_data_source.dart';
import 'package:lucy_frontend/features/auth/data/dtos/user_profile_dto.dart';
import 'package:lucy_frontend/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:lucy_frontend/features/auth/domain/entities/auth_user.dart';
import 'package:lucy_frontend/features/auth/domain/exceptions/auth_exception.dart';

class _FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  AuthUserSnapshot? current;
  bool deleteUserCalled = false;

  @override
  AuthUserSnapshot? get currentUser => current;

  @override
  Stream<AuthUserSnapshot?> authStateChanges() => Stream.value(current);

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

  @override
  Future<String?> getIdToken({bool forceRefresh = false}) async => 'fake-token';
}

class _FakeProfileRemoteDataSource implements UserProfileRemoteDataSource {
  bool shouldFail = false;
  bool shouldFailFetch = false;
  String failCode = 'profile-write-failed';
  UserProfileDto? lastWritten;

  @override
  Future<void> createUserProfile({
    required String uid,
    required UserProfileDto profile,
  }) async {
    if (shouldFail) {
      throw AuthProfileApiException(failCode);
    }
    lastWritten = profile;
  }

  @override
  Future<UserProfileDto?> fetchUserProfile({required String uid}) async {
    if (shouldFailFetch) {
      throw AuthProfileApiException(failCode);
    }
    return lastWritten;
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
      expect(profileRemote.lastWritten?.isConfigured, isFalse);
      expect(authRemote.deleteUserCalled, isFalse);
    });

    test(
      'fetchIsConfiguredForCurrentUser returns false when not signed in',
      () async {
        expect(await repository.fetchIsConfiguredForCurrentUser(), isFalse);
      },
    );

    test('fetchIsConfiguredForCurrentUser reads profile flag', () async {
      await repository.signUpWithEmailAndPassword(
        email: 'cfg@lucy.test',
        password: 'password123',
        fullName: 'Cfg User',
      );
      expect(await repository.fetchIsConfiguredForCurrentUser(), isFalse);
      profileRemote.lastWritten = profileRemote.lastWritten!.copyWith(
        isConfigured: true,
      );
      expect(await repository.fetchIsConfiguredForCurrentUser(), isTrue);
    });

    test('signUp rolls back auth user when profile API fails', () async {
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

    test('signUp rolls back on user-profile-conflict', () async {
      profileRemote.shouldFail = true;
      profileRemote.failCode = 'user-profile-conflict';

      await expectLater(
        repository.signUpWithEmailAndPassword(
          email: 'conflict@lucy.test',
          password: 'password123',
          fullName: 'Conflict User',
        ),
        throwsA(
          isA<AuthException>().having(
            (e) => e.code,
            'code',
            'user-profile-conflict',
          ),
        ),
      );

      expect(authRemote.deleteUserCalled, isTrue);
    });

    test(
      'fetchIsConfiguredForCurrentUser returns false when profile API fails',
      () async {
        authRemote.current = const AuthUserSnapshot(
          uid: 'uid-1',
          email: 'a@lucy.test',
        );
        profileRemote.shouldFailFetch = true;
      },
    );

    test('authStateChanges maps snapshots to AuthUser entities', () async {
      authRemote.current = const AuthUserSnapshot(
        uid: 'uid-1',
        email: 'a@lucy.test',
        displayName: 'A',
      );

      final values = await repository.authStateChanges().first;

      expect(
        values,
        const AuthUser(uid: 'uid-1', email: 'a@lucy.test', displayName: 'A'),
      );
    });
  });
}
