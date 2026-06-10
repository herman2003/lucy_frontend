import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/auth/data/dtos/user_profile_dto.dart';
import 'package:lucy_frontend/features/auth/data/mappers/user_profile_mapper.dart';

/// CP-0 — signup must persist `isConfigured: false` (SPEC §4.4).
void main() {
  test('signup profile DTO defaults isConfigured to false for Firestore', () {
    final dto = UserProfileDto(
      fullName: 'New User',
      email: 'new@lucy.test',
      createdAt: '2026-05-25T12:00:00.000Z',
      isConfigured: false,
    );

    expect(dto.toFirestoreMap(), containsPair('isConfigured', false));
  });
}
