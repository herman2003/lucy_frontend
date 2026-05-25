import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/features/auth/data/dtos/user_profile_dto.dart';
import 'package:frontend/features/auth/data/mappers/user_profile_mapper.dart';

void main() {
  group('UserProfileMapper', () {
    test('toFirestoreMap writes expected keys', () {
      const dto = UserProfileDto(
        fullName: 'Jane Doe',
        email: 'jane@lucy.test',
        createdAt: '2026-05-25T12:00:00.000Z',
      );

      expect(
        dto.toFirestoreMap(),
        {
          'fullName': 'Jane Doe',
          'email': 'jane@lucy.test',
          'createdAt': '2026-05-25T12:00:00.000Z',
        },
      );
    });

    test('fromFirestoreMap reads document fields', () {
      final dto = UserProfileMapper.fromFirestoreMap({
        'fullName': 'John',
        'email': 'john@lucy.test',
        'createdAt': '2026-05-25T10:00:00.000Z',
      });

      expect(
        dto,
        const UserProfileDto(
          fullName: 'John',
          email: 'john@lucy.test',
          createdAt: '2026-05-25T10:00:00.000Z',
        ),
      );
    });
  });
}
