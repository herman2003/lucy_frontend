import 'package:firebase_auth/firebase_auth.dart';

import '../exceptions/firebase_auth_data_exception.dart';
import 'auth_remote_data_source.dart';
import 'auth_user_snapshot.dart';

/// Firebase Authentication datasource — sole `firebase_auth` entry point.
class FirebaseAuthRemoteDataSource implements AuthRemoteDataSource {
  FirebaseAuthRemoteDataSource(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  AuthUserSnapshot? get currentUser => _toSnapshot(_firebaseAuth.currentUser);

  @override
  Stream<AuthUserSnapshot?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(_toSnapshot);
  }

  @override
  Future<AuthUserSnapshot> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _wrap(() async {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _requireSnapshot(credential.user);
    });
  }

  @override
  Future<AuthUserSnapshot> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _wrap(() async {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _requireSnapshot(credential.user);
    });
  }

  @override
  Future<void> updateDisplayName({
    required String uid,
    required String displayName,
  }) async {
    await _runVoid(() async {
      final user = _firebaseAuth.currentUser;
      if (user == null || user.uid != uid) {
        throw const FirebaseAuthDataException(
          code: 'user-not-found',
          message: 'No signed-in user to update',
        );
      }
      await user.updateDisplayName(displayName);
    });
  }

  @override
  Future<void> deleteCurrentUser() async {
    await _runVoid(() async {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return;
      }
      await user.delete();
    });
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _runVoid(() async {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    });
  }

  @override
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await _runVoid(() async {
      final user = _firebaseAuth.currentUser;
      final email = user?.email;
      if (user == null || email == null || email.isEmpty) {
        throw const FirebaseAuthDataException(
          code: 'user-not-found',
          message: 'No signed-in user',
        );
      }
      final credential = EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    });
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<String?> getIdToken({bool forceRefresh = false}) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }
    return _wrap(() => user.getIdToken(forceRefresh));
  }

  AuthUserSnapshot? _toSnapshot(User? user) {
    if (user == null) {
      return null;
    }
    return AuthUserSnapshot(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }

  AuthUserSnapshot _requireSnapshot(User? user) {
    final snapshot = _toSnapshot(user);
    if (snapshot == null) {
      throw const FirebaseAuthDataException(
        code: 'user-not-found',
        message: 'Missing user after auth operation',
      );
    }
    return snapshot;
  }

  Future<T> _wrap<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthDataException(code: e.code, message: e.message);
    }
  }

  Future<void> _runVoid(Future<void> Function() action) async {
    await _wrap(() async {
      await action();
      return 0;
    });
  }
}
