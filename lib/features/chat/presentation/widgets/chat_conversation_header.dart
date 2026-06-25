import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/lucy/lucy_chip.dart';

/// Conversation header — thread title, subtitle, active docs chip (V3/V4).
class ChatConversationHeader extends StatelessWidget {
  const ChatConversationHeader({
    required this.threadTitle,
    required this.subtitle,
    super.key,
    this.activeDocumentCount,
    this.showActiveDocumentsChip = true,
    this.trailing,
  });

  final String threadTitle;
  final String subtitle;
  final int? activeDocumentCount;
  final bool showActiveDocumentsChip;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final l10n = context.l10n;
    final showChip =
        showActiveDocumentsChip &&
        activeDocumentCount != null &&
        activeDocumentCount! > 0;

    return Material(
      color: scheme.surface,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: lucy.border)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            LucySpacing.spaceXl,
            LucySpacing.spaceMd,
            LucySpacing.spaceLg,
            LucySpacing.spaceMd,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      threadTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: lucy.muted,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              if (showChip) ...[
                const SizedBox(width: LucySpacing.spaceMd),
                LucyChip(
                  label: l10n.chatActiveDocumentsCount(activeDocumentCount!),
                  variant: LucyChipVariant.teal,
                ),
              ],
              if (trailing != null) ...[
                const SizedBox(width: LucySpacing.spaceSm),
                trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
