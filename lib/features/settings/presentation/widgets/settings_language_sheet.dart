import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../utils/settings_ui_locale_l10n.dart';

/// Bottom sheet to pick interface language (fr / en / de).
Future<void> showSettingsLanguageSheet({
  required BuildContext context,
  required String? currentCode,
  required ValueChanged<String> onSelected,
}) {
  final l10n = context.l10n;
  final options = const ['fr', 'en', 'de'];
  final selected = currentCode ?? 'de';

  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    backgroundColor: context.lucyTheme.scaffoldBackground,
    builder: (sheetContext) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                LucySpacing.spaceLg,
                0,
                LucySpacing.spaceLg,
                LucySpacing.spaceMd,
              ),
              child: Text(
                l10n.settingsUiLocaleLabel,
                style: Theme.of(sheetContext).textTheme.titleMedium,
              ),
            ),
            for (final code in options)
              RadioListTile<String>(
                title: Text(
                  SettingsUiLocaleL10n.label(
                    AppLocalizations.of(sheetContext)!,
                    code,
                  ),
                ),
                value: code,
                groupValue: selected,
                onChanged: (next) {
                  if (next == null) {
                    return;
                  }
                  Navigator.of(sheetContext).pop();
                  onSelected(next);
                },
              ),
            const SizedBox(height: LucySpacing.spaceMd),
          ],
        ),
      );
    },
  );
}
