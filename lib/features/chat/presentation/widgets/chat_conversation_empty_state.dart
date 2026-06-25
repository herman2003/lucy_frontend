import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../shared/widgets/lucy/lucy_chip.dart';
import '../../../../shared/widgets/lucy/lucy_empty_state.dart';

/// Empty conversation with quick suggestion chips (V3/V4 redesign).
class ChatConversationEmptyState extends StatelessWidget {
  const ChatConversationEmptyState({
    required this.message,
    required this.suggestions,
    required this.onSuggestionSelected,
    super.key,
  });

  final String message;
  final List<String> suggestions;
  final ValueChanged<String> onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(LucySpacing.spaceXl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LucyEmptyState(message: message),
            const SizedBox(height: LucySpacing.spaceLg),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: LucySpacing.spaceSm,
              runSpacing: LucySpacing.spaceSm,
              children: suggestions
                  .map(
                    (suggestion) => _SuggestionChip(
                      label: suggestion,
                      onTap: () => onSuggestionSelected(suggestion),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  const _SuggestionChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(LucySpacing.radiusPill),
        child: LucyChip(
          label: label,
          variant: LucyChipVariant.teal,
        ),
      ),
    );
  }
}
