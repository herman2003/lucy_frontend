import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_chat_message.freezed.dart';

@freezed
abstract class OnboardingChatMessage with _$OnboardingChatMessage {
  const factory OnboardingChatMessage({
    required bool isFromLucy,
    required String text,
  }) = _OnboardingChatMessage;
}
