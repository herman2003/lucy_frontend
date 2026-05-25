import '../../domain/entities/auth_user.dart';
import '../datasources/auth_user_snapshot.dart';

/// Maps [AuthUserSnapshot] to domain [AuthUser].
class AuthUserMapper {
  AuthUserMapper._();

  static AuthUser fromSnapshot(AuthUserSnapshot snapshot) {
    return AuthUser(
      uid: snapshot.uid,
      email: snapshot.email ?? '',
      displayName: snapshot.displayName,
    );
  }

  static AuthUser? fromSnapshotNullable(AuthUserSnapshot? snapshot) {
    if (snapshot == null) {
      return null;
    }
    return fromSnapshot(snapshot);
  }
}
