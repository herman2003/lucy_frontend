import 'package:flutter/material.dart';

/// Shared chat bubble layout tokens (SPEC §4.5.1, onboarding messaging).
abstract final class LucyChatConstants {
  static const double kBubbleCornerRadius = 16;
  static const double kBubbleTailRadius = 4;
  static const double kAvatarSize = 36;
  static const double kMaxBubbleWidthFactor = 0.78;

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
