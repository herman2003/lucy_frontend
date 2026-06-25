import 'package:flutter/material.dart';

import '../../../core/constants/lucy_spacing.dart';
import '../../../core/extensions/context.dart';
import '../../../core/theme/lucy_theme_extensions.dart';

/// Pill-style segmented control for settings (light/dark, etc.).
class LucySegmentedControl extends StatelessWidget {
  const LucySegmentedControl({
    required this.labels,
    required this.onSelected,
    super.key,
    this.selectedIndex,
  });

  final List<String> labels;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final lucy = context.lucyTheme;
    final scheme = context.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: lucy.chipBackground,
        borderRadius: BorderRadius.circular(LucySpacing.radiusPill),
        border: Border.all(color: lucy.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(LucySpacing.spaceXs),
        child: Row(
          children: [
            for (var i = 0; i < labels.length; i++) ...[
              if (i > 0) const SizedBox(width: LucySpacing.spaceXs),
              Expanded(
                child: _Segment(
                  label: labels[i],
                  selected: selectedIndex == i,
                  onTap: () => onSelected(i),
                  selectedColor: scheme.primary,
                  selectedForeground: scheme.onPrimary,
                  unselectedForeground: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.selectedColor,
    required this.selectedForeground,
    required this.unselectedForeground,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color selectedForeground;
  final Color unselectedForeground;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? selectedColor : Colors.transparent,
      borderRadius: BorderRadius.circular(LucySpacing.radiusPill),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: LucySpacing.spaceSm + 2,
          ),
          child: Center(
            child: Text(
              label,
              style: context.textTheme.labelLarge?.copyWith(
                color: selected ? selectedForeground : unselectedForeground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
