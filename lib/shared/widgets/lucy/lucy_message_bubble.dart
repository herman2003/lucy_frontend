import 'package:flutter/material.dart';

import '../../../core/constants/lucy_chat_constants.dart';
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
  });

  final LucyMessageBubbleRole role;
  final String text;
  final bool isTyping;
  final List<LucyMessageSourceData> sources;

  @override
  Widget build(BuildContext context) {
    return switch (role) {
      LucyMessageBubbleRole.user => _UserBubble(text: text),
      LucyMessageBubbleRole.assistant =>
        isTyping
            ? const _LucyTypingBubble()
            : _LucyAssistantMessage(text: text, sources: sources),
    };
  }
}

class _UserBubble extends StatelessWidget {
  const _UserBubble({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.sizeOf(context).width *
              LucyChatConstants.kUserMaxBubbleWidthFactor,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: LucySpacing.spaceLg,
          vertical: LucySpacing.spaceMd,
        ),
        decoration: BoxDecoration(
          color: scheme.primary,
          borderRadius: LucyChatConstants.userBubbleRadius,
          boxShadow: [
            BoxShadow(
              color: scheme.primary.withValues(alpha: 0.22),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: context.textTheme.bodyLarge?.copyWith(color: scheme.onPrimary),
        ),
      ),
    );
  }
}

class _LucyAssistantMessage extends StatelessWidget {
  const _LucyAssistantMessage({required this.text, required this.sources});

  final String text;
  final List<LucyMessageSourceData> sources;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LucyAvatar(size: LucyChatConstants.kLucyAvatarSize),
        const SizedBox(width: LucyChatConstants.kAvatarGap),
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.sizeOf(context).width *
                  LucyChatConstants.kLucyMaxBubbleWidthFactor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _LucyBubbleContent(text: text),
                ...sources.map(
                  (source) => Padding(
                    padding: const EdgeInsets.only(top: LucySpacing.spaceMd),
                    child: LucySourceCard(
                      title: source.title,
                      excerpt: source.excerpt,
                      pagesLabel: source.pagesLabel,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LucyBubbleContent extends StatelessWidget {
  const _LucyBubbleContent({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: LucySpacing.spaceLg,
        vertical: LucySpacing.spaceMd + 3,
      ),
      decoration: BoxDecoration(
        color: lucy.lucyBubbleBackground,
        borderRadius: LucyChatConstants.lucyBubbleRadius,
        border: Border.all(color: lucy.border.withValues(alpha: 0.6)),
        boxShadow: [
          BoxShadow(
            color: scheme.onSurface.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LucyFormattedMessageText(text: text, color: scheme.onSurface),
    );
  }
}

class _LucyTypingBubble extends StatelessWidget {
  const _LucyTypingBubble();

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LucyAvatar(
          size: LucyChatConstants.kLucyAvatarSize,
          pulsing: true,
        ),
        const SizedBox(width: LucyChatConstants.kAvatarGap),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: LucySpacing.spaceLg,
            vertical: LucySpacing.spaceMd + 2,
          ),
          decoration: BoxDecoration(
            color: lucy.lucyBubbleBackground,
            borderRadius: LucyChatConstants.lucyBubbleRadius,
            border: Border.all(color: lucy.border.withValues(alpha: 0.6)),
          ),
          child: const LucyTypingDots(),
        ),
      ],
    );
  }
}
