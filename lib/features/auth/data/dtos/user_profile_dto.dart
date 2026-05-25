import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_dto.freezed.dart';

/// Firestore document `users/{uid}` (data layer).
@freezed
abstract class UserProfileDto with _$UserProfileDto {
  const factory UserProfileDto({
    required String fullName,
    required String email,
    required String createdAt,
  }) = _UserProfileDto;
}
