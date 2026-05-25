import '../dtos/user_profile_dto.dart';

/// Contract for Firestore `users/{uid}` profile writes.
abstract class UserProfileRemoteDataSource {
  Future<void> createUserProfile({
    required String uid,
    required UserProfileDto profile,
  });
}
