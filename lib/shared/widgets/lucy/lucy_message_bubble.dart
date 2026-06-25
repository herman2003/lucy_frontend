import 'package:flutter/material.dart';

import '../../../core/constants/lucy_chat_constants.dart';
import '../../../core/constants/lucy_constants.dart';
import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';
import '../branding/lucy_avatar.dart';
import '../chat/lucy_formatted_message_text.dart';
import 'lucy_source_card.dart';
import 'lucy_typing_dots.dart';

/// Role for [LucyMessageBubble].
enum LucyMessageBubbleRole { user, assistant }

/// Source citation data for [LucyMessageBubble] (no feature imports).
class LucyMessageSourceData {
  const LucyMessageSourceData({
    required this.title,
    required this.excerpt,
    this.pagesLabel,
  });

  final String title;
  final String excerpt;
  final String? pagesLabel;
}

/// Chat message bubble — user primary or Lucy gradient avatar (V3/V4).
class LucyMessageBubble extends StatelessWidget {
  const LucyMessageBubble({
    required this.role,
    required this.text,
    super.key,
    this.isTyping = false,
    this.sources = const [],
    this.typingLabel,
  });

  final LucyMessageBubbleRole role;
  final String text;
  final bool isTyping;
  final List<LucyMessageSourceData> sources;
  final String? typingLabel;

  @override
  Widget build(BuildContext context) {
    final bubble = switch (role) {
      LucyMessageBubbleRole.user => _UserBubble(text: text),
      LucyMessageBubbleRole.assistant => isTyping
          ? _LucyTypingBubble(label: typingLabel)
          : _LucyBubble(text: text),
    };

    if (sources.isEmpty) {
      return bubble;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        bubble,
        const SizedBox(height: LucySpacing.spaceSm),
        ...sources.map(
          (source) => LucySourceCard(
            title: source.title,
            excerpt: source.excerpt,
            pagesLabel: source.pagesLabel,
          ),
        ),
      ],
    );
  }
}

class _UserBubble extends StatelessWidget {
  const _UserBubble({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.sizeOf(context).width *
                  LucyChatConstants.kMaxBubbleWidthFactor,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: LucySpacing.spaceMd,
              vertical: LucySpacing.spaceSm + 4,
            ),
            decoration: BoxDecoration(
              color: scheme.primary,
              borderRadius: LucyChatConstants.userBubbleRadius,
            ),
            child: Text(
              text,
              style: context.textTheme.bodyLarge?.copyWith(
                color: scheme.onPrimary,
              ),
            ),
          ),
        ),
        const SizedBox(width: LucySpacing.spaceSm),
        CircleAvatar(
          radius: LucyChatConstants.kAvatarSize / 2,
          backgroundColor: scheme.tertiary,
          child: Icon(
            Icons.person_outline,
            color: scheme.onTertiary,
            size: LucyConstants.kIconMedium,
          ),
        ),
      ],
    );
  }
}

class _LucyBubble extends StatelessWidget {
  const _LucyBubble({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const LucyAvatar(size: LucyChatConstants.kAvatarSize),
        const SizedBox(width: LucySpacing.spaceSm),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: LucySpacing.spaceMd,
              vertical: LucySpacing.spaceSm + 4,
            ),
            decoration: BoxDecoration(
              color: lucy.lucyBubbleBackground,
              borderRadius: LucyChatConstants.lucyBubbleRadius,
              border: Border.all(color: lucy.border.withValues(alpha: 0.6)),
            ),
            child: LucyFormattedMessageText(
              text: text,
              color: scheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}

class _LucyTypingBubble extends StatelessWidget {
  const _LucyTypingBubble({this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const LucyAvatar(size: LucyChatConstants.kAvatarSize, pulsing: true),
        const SizedBox(width: LucySpacing.spaceSm),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: LucySpacing.spaceMd,
              vertical: LucySpacing.spaceSm + 4,
            ),
            decoration: BoxDecoration(
              color: lucy.lucyBubbleBackground,
              borderRadius: LucyChatConstants.lucyBubbleRadius,
              border: Border.all(color: lucy.border.withValues(alpha: 0.6)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (label != null) ...[
                  Text(
                    label!,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: lucy.muted,
                    ),
                  ),
                  const SizedBox(width: LucySpacing.spaceSm),
                ],
                const LucyTypingDots(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
