import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/auth/data/dtos/user_profile_dto.dart';
import 'package:lucy_frontend/features/auth/data/mappers/user_profile_mapper.dart';

void main() {
  group('UserProfileMapper', () {
    test('toFirestoreMap writes expected keys including isConfigured', () {
      const dto = UserProfileDto(
        fullName: 'Jane Doe',
        email: 'jane@lucy.test',
        createdAt: '2026-05-25T12:00:00.000Z',
        isConfigured: false,
      );

      expect(dto.toFirestoreMap(), {
        'fullName': 'Jane Doe',
        'email': 'jane@lucy.test',
        'createdAt': '2026-05-25T12:00:00.000Z',
        'isConfigured': false,
      });
    });

    test('fromFirestoreMap reads isConfigured when present', () {
      final dto = UserProfileMapper.fromFirestoreMap({
        'fullName': 'John',
        'email': 'john@lucy.test',
        'createdAt': '2026-05-25T10:00:00.000Z',
        'isConfigured': true,
      });

      expect(
        dto,
        const UserProfileDto(
          fullName: 'John',
          email: 'john@lucy.test',
          createdAt: '2026-05-25T10:00:00.000Z',
          isConfigured: true,
        ),
      );
    });

    test('fromFirestoreMap treats missing isConfigured as false', () {
      final dto = UserProfileMapper.fromFirestoreMap({
        'fullName': 'Legacy',
        'email': 'legacy@lucy.test',
        'createdAt': '2026-05-25T10:00:00.000Z',
      });

      expect(dto.isConfigured, isFalse);
      expect(dto.isConfiguredEffective, isFalse);
    });

    test('fromApiJson maps Nest users/me response', () {
      final dto = UserProfileMapper.fromApiJson({
        'uid': 'uid-1',
        'fullName': 'Jane',
        'email': 'jane@lucy.test',
        'createdAt': '2026-05-25T12:00:00.000Z',
        'isConfigured': true,
        'onboardingStatus': 'completed',
      });

      expect(
        dto,
        const UserProfileDto(
          fullName: 'Jane',
          email: 'jane@lucy.test',
          createdAt: '2026-05-25T12:00:00.000Z',
          isConfigured: true,
        ),
      );
    });

    test('fromFirestoreMap treats null isConfigured as false', () {
      final dto = UserProfileMapper.fromFirestoreMap({
        'fullName': 'Legacy',
        'email': 'legacy@lucy.test',
        'createdAt': '2026-05-25T10:00:00.000Z',
        'isConfigured': null,
      });

      expect(dto.isConfiguredEffective, isFalse);
    });
  });
}
