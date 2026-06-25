import 'package:flutter/material.dart';

import '../constants/lucy_spacing.dart';
import '../extensions/context.dart';
import '../theme/lucy_theme_extensions.dart';
import 'lucy_shell_navigation.dart';

/// Mobile bottom navigation — V4 maquette (emoji + label, flat bar).
class LucyBottomNav extends StatelessWidget {
  const LucyBottomNav({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  final int activeIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = context.colorScheme;
    final lucyTheme = context.lucyTheme;
    final items = LucyShellNavigation.navItems(l10n);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surface,
        border: Border(top: BorderSide(color: lucyTheme.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            LucySpacing.spaceSm,
            LucySpacing.spaceSm,
            LucySpacing.spaceSm,
            LucySpacing.spaceMd,
          ),
          child: Row(
            children: [
              for (final item in items)
                Expanded(
                  child: _NavCell(
                    item: item,
                    isActive: activeIndex == item.branchIndex,
                    onTap: () => onTap(item.branchIndex),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavCell extends StatelessWidget {
  const _NavCell({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final LucyShellNavItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final color = isActive ? scheme.primary : scheme.onSurfaceVariant;

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: LucySpacing.minTouchTarget),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.emoji,
                style: TextStyle(fontSize: 21, color: color),
              ),
              const SizedBox(height: 3),
              Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
