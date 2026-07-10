import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';

import '../../utils/chat_markdown_normalizer.dart';

/// Renders assistant chat copy as lightweight Markdown (paragraphs, lists, emphasis).
class LucyFormattedMessageText extends StatelessWidget {
  const LucyFormattedMessageText({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }

    final bodyStyle = Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(color: color, height: 1.45);

    final baseSheet = MarkdownStyleSheet.fromTheme(Theme.of(context));
    final styleSheet = baseSheet.copyWith(
      p: bodyStyle,
      pPadding: const EdgeInsets.only(bottom: 8),
      listBullet: bodyStyle,
      listIndent: 20,
      blockSpacing: 8,
      h1: bodyStyle?.copyWith(fontWeight: FontWeight.w600),
      h2: bodyStyle?.copyWith(fontWeight: FontWeight.w600),
      h3: bodyStyle?.copyWith(fontWeight: FontWeight.w600),
      strong: bodyStyle?.copyWith(fontWeight: FontWeight.w600),
      em: bodyStyle?.copyWith(fontStyle: FontStyle.italic),
      blockquote: bodyStyle?.copyWith(color: color.withValues(alpha: 0.85)),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: color.withValues(alpha: 0.35), width: 3),
        ),
      ),
      blockquotePadding: const EdgeInsets.only(left: 12, bottom: 4),
      code: bodyStyle?.copyWith(
        fontFamily: 'monospace',
        fontSize: (bodyStyle.fontSize ?? 16) * 0.92,
      ),
    );

    final normalizedText = normalizeChatMarkdown(text);

    return MarkdownBody(
      data: normalizedText,
      styleSheet: styleSheet,
      shrinkWrap: true,
      selectable: true,
    );
  }
}
