import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';

/// Tappable settings row — [ColorScheme.primary] + [ColorScheme.surface] only.
class SettingsNavigationTile extends StatelessWidget {
  const SettingsNavigationTile({
    super.key,
    required this.icon,
    required this.label,
    this.trailingText,
    this.onTap,
    this.showChevron = true,
  });

  final IconData icon;
  final String label;
  final String? trailingText;
  final VoidCallback? onTap;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Material(
      color: scheme.surface,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucyConstants.kContainerPaddingMedium,
            vertical: LucyConstants.kContainerPaddingMedium,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(
                    LucyConstants.kBorderRadiusSmall,
                  ),
                ),
                child: Icon(
                  icon,
                  color: scheme.surface,
                  size: LucyConstants.kIconMedium,
                ),
              ),
              const SizedBox(width: LucyConstants.kSpacingHigh),
              Expanded(
                child: Text(
                  label,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: scheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailingText != null) ...[
                Flexible(
                  child: Text(
                    trailingText!,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: scheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: LucyConstants.kSpacingLow),
              ],
              if (showChevron)
                Icon(
                  Icons.chevron_right,
                  color: scheme.primary,
                  size: LucyConstants.kIconMedium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
