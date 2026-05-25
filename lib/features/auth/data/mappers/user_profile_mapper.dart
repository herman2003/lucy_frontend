import '../dtos/user_profile_dto.dart';

/// Maps [UserProfileDto] to/from Firestore field maps.
extension UserProfileDtoFirestore on UserProfileDto {
  Map<String, dynamic> toFirestoreMap() {
    return {
      'fullName': fullName,
      'email': email,
      'createdAt': createdAt,
    };
  }
}

extension UserProfileFirestoreMap on Map<String, dynamic> {
  UserProfileDto toUserProfileDto() {
    return UserProfileDto(
      fullName: this['fullName'] as String,
      email: this['email'] as String,
      createdAt: this['createdAt'] as String,
    );
  }
}

/// Named factory for tests and repository.
class UserProfileMapper {
  UserProfileMapper._();

  static UserProfileDto fromFirestoreMap(Map<String, dynamic> map) {
    return map.toUserProfileDto();
  }
}
