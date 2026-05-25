import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/auth/data/datasources/auth_user_snapshot.dart';
import 'package:frontend/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:frontend/features/auth/domain/entities/auth_user.dart';

void main() {
  group('AuthUserMapper', () {
    test('maps snapshot fields to AuthUser entity', () {
      const snapshot = AuthUserSnapshot(
        uid: 'uid-42',
        email: 'user@lucy.test',
        displayName: 'Jane Doe',
      );

      final entity = AuthUserMapper.fromSnapshot(snapshot);

      expect(
        entity,
        const AuthUser(
          uid: 'uid-42',
          email: 'user@lucy.test',
          displayName: 'Jane Doe',
        ),
      );
    });

    test('returns null when snapshot is null', () {
      expect(AuthUserMapper.fromSnapshotNullable(null), isNull);
    });
  });
}
