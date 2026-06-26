import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_chat_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/branding/lucy_avatar.dart';
import 'chat_quick_chips_bar.dart';

/// Empty conversation with Lucy avatar, greeting, and neutral chips (V3/V4).
class ChatConversationEmptyState extends StatelessWidget {
  const ChatConversationEmptyState({
    required this.greeting,
    required this.message,
    required this.suggestions,
    required this.onSuggestionSelected,
    super.key,
  });

  final String greeting;
  final String message;
  final List<String> suggestions;
  final ValueChanged<String> onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(LucySpacing.spaceXl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LucyAvatar(size: LucyChatConstants.kEmptyStateAvatarSize),
              const SizedBox(height: LucySpacing.spaceLg + 2),
              Text(
                greeting,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall?.copyWith(fontSize: 23),
              ),
              const SizedBox(height: LucySpacing.spaceSm + 3),
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: lucy.muted,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: LucySpacing.spaceXl - 2),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: LucySpacing.spaceSm + 1,
                runSpacing: LucySpacing.spaceSm + 1,
                children: suggestions
                    .map(
                      (suggestion) => ChatQuickChipButton(
                        label: suggestion,
                        onTap: () => onSuggestionSelected(suggestion),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
