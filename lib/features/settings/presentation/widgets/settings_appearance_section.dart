import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_provider.dart';
import '../../../../shared/widgets/lucy/lucy_interface_style_picker.dart';
import '../../../../shared/widgets/lucy/lucy_segmented_control.dart';
import 'settings_section_header.dart';

/// Appearance controls: light/dark segmented + interface style previews.
class SettingsAppearanceSection extends ConsumerWidget {
  const SettingsAppearanceSection({super.key});

  int? _brightnessIndex(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 0,
        ThemeMode.dark => 1,
        ThemeMode.system => null,
      };

  ThemeMode _themeModeForIndex(int index) => switch (index) {
        0 => ThemeMode.light,
        1 => ThemeMode.dark,
        _ => ThemeMode.light,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final prefs = ref.watch(lucyAppThemeProvider);
    final themeNotifier = ref.read(lucyAppThemeProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsSectionHeader(title: l10n.appearanceSectionTitle),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucyConstants.kContainerPaddingMedium,
          ),
          child: LucySegmentedControl(
            labels: [l10n.appearanceLight, l10n.appearanceDark],
            selectedIndex: _brightnessIndex(prefs.themeMode),
            onSelected: (index) =>
                themeNotifier.setThemeMode(_themeModeForIndex(index)),
          ),
        ),
        const SizedBox(height: LucySpacing.spaceLg),
        SettingsSectionHeader(title: l10n.interfaceStyleSectionTitle),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucyConstants.kContainerPaddingMedium,
          ),
          child: Text(
            l10n.interfaceStyleSectionHint,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(height: LucySpacing.spaceMd),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: LucyConstants.kContainerPaddingMedium,
          ),
          child: LucyInterfaceStylePicker(
            selected: prefs.interfaceStyle,
            onSelected: themeNotifier.setInterfaceStyle,
          ),
        ),
      ],
    );
  }
}
