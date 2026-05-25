import '../dtos/user_profile_dto.dart';

/// Contract for Nest `users/me` profile reads and writes.
abstract class UserProfileRemoteDataSource {
  Future<void> createUserProfile({
    required String uid,
    required UserProfileDto profile,
  });

  /// Reads `users/{uid}` for router guard and onboarding reprise (SPEC §4).
  Future<UserProfileDto?> fetchUserProfile({required String uid});
}
