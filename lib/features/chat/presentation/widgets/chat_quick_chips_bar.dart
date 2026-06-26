import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../domain/entities/chat_quick_chip.dart';

/// Horizontal quick-action chips above the chat composer (LEARN-11a).
class ChatQuickChipsBar extends StatelessWidget {
  const ChatQuickChipsBar({
    required this.chips,
    required this.onChipSelected,
    super.key,
  });

  final List<ChatQuickChip> chips;
  final ValueChanged<ChatQuickChip> onChipSelected;

  @override
  Widget build(BuildContext context) {
    if (chips.isEmpty) {
      return const SizedBox.shrink();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(
        LucySpacing.spaceLg,
        LucySpacing.spaceSm,
        LucySpacing.spaceLg,
        LucySpacing.spaceXs,
      ),
      child: Row(
        children: [
          for (var index = 0; index < chips.length; index++) ...[
            if (index > 0) const SizedBox(width: LucySpacing.spaceSm),
            ChatQuickChipButton(
              label: chips[index].label,
              onTap: () => onChipSelected(chips[index]),
            ),
          ],
        ],
      ),
    );
  }
}

/// Single quick-action chip (shared with empty-state suggestions).
class ChatQuickChipButton extends StatelessWidget {
  const ChatQuickChipButton({required this.label, required this.onTap, super.key});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Material(
      color: scheme.surface,
      shape: StadiumBorder(side: BorderSide(color: lucy.border)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucySpacing.spaceMd + 3,
            vertical: LucySpacing.spaceSm + 1,
          ),
          child: Text(
            label,
            style: context.textTheme.bodyMedium?.copyWith(
              color: scheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
