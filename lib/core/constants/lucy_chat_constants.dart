import 'package:flutter/material.dart';

/// Shared chat bubble layout tokens (SPEC §4.5.1, onboarding messaging).
abstract final class LucyChatConstants {
  static const double kBubbleCornerRadius = 16;
  static const double kBubbleTailRadius = 4;
  static const double kLucyAvatarSize = 34;
  static const double kEmptyStateAvatarSize = 66;
  static const double kAvatarGap = 13;
  static const double kUserMaxBubbleWidthFactor = 0.62;
  static const double kLucyMaxBubbleWidthFactor = 0.82;
  static const double kSendButtonSize = 40;

  static BorderRadius lucyBubbleRadius = const BorderRadius.only(
    topLeft: Radius.circular(kBubbleCornerRadius),
    topRight: Radius.circular(kBubbleCornerRadius),
    bottomRight: Radius.circular(kBubbleCornerRadius),
    bottomLeft: Radius.circular(kBubbleTailRadius),
  );

  static BorderRadius userBubbleRadius = const BorderRadius.only(
    topLeft: Radius.circular(kBubbleCornerRadius),
    topRight: Radius.circular(kBubbleCornerRadius),
    bottomLeft: Radius.circular(kBubbleCornerRadius),
    bottomRight: Radius.circular(kBubbleTailRadius),
  );
}
