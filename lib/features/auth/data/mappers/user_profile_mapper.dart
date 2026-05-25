import '../dtos/user_profile_dto.dart';

/// Maps [UserProfileDto] to/from Firestore field maps.
extension UserProfileDtoFirestore on UserProfileDto {
  Map<String, dynamic> toFirestoreMap() {
    return {
      'fullName': fullName,
      'email': email,
      'createdAt': createdAt,
      'isConfigured': isConfigured,
    };
  }
}

extension UserProfileFirestoreMap on Map<String, dynamic> {
  UserProfileDto toUserProfileDto() {
    return UserProfileDto(
      fullName: this['fullName'] as String,
      email: this['email'] as String,
      createdAt: this['createdAt'] as String,
      isConfigured: _readIsConfigured(this['isConfigured']),
    );
  }
}

bool _readIsConfigured(Object? value) {
  if (value == null) {
    return false;
  }
  if (value is bool) {
    return value;
  }
  return false;
}

/// Named factory for tests and repository.
class UserProfileMapper {
  UserProfileMapper._();

  static UserProfileDto fromFirestoreMap(Map<String, dynamic> map) {
    return map.toUserProfileDto();
  }
}
