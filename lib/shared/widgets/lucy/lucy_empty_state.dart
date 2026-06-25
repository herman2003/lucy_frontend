import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';

/// Centered placeholder when a list or panel has no content.
class LucyEmptyState extends StatelessWidget {
  const LucyEmptyState({
    required this.message,
    super.key,
    this.title,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onAction,
  });

  final String? title;
  final String message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(LucySpacing.spaceXl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: lucy.muted),
              const SizedBox(height: LucySpacing.spaceLg),
              if (title != null) ...[
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(height: LucySpacing.spaceSm),
              ],
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: lucy.muted,
                  height: 1.45,
                ),
              ),
              if (actionLabel != null && onAction != null) ...[
                const SizedBox(height: LucySpacing.spaceXl),
                FilledButton(onPressed: onAction, child: Text(actionLabel!)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
