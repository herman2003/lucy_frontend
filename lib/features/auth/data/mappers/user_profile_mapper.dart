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

  static UserProfileDto fromApiJson(Map<String, dynamic> json) {
    return UserProfileDto(
      fullName: json['fullName'] is String ? json['fullName'] as String : '',
      email: json['email'] is String ? json['email'] as String : '',
      createdAt:
          json['createdAt'] is String
              ? json['createdAt'] as String
              : DateTime.fromMillisecondsSinceEpoch(0).toUtc().toIso8601String(),
      isConfigured: json['isConfigured'] == true,
    );
  }
}
