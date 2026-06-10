import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../utils/settings_ui_locale_l10n.dart';

/// Bottom sheet to pick interface language (fr / en / de).
Future<void> showSettingsLanguageSheet({
  required BuildContext context,
  required String? currentCode,
  required ValueChanged<String> onSelected,
}) {
  final l10n = context.l10n;
  final scheme = context.colorScheme;
  final options = const ['fr', 'en', 'de'];
  final selected = currentCode ?? 'de';

  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    backgroundColor: scheme.surface,
    builder: (sheetContext) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                LucyConstants.kContainerPaddingMedium,
                0,
                LucyConstants.kContainerPaddingMedium,
                LucyConstants.kSpacingMedium,
              ),
              child: Text(
                l10n.settingsUiLocaleLabel,
                style: Theme.of(sheetContext).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: scheme.primary,
                ),
              ),
            ),
            for (final code in options)
              RadioListTile<String>(
                title: Text(
                  SettingsUiLocaleL10n.label(
                    AppLocalizations.of(sheetContext)!,
                    code,
                  ),
                  style: TextStyle(color: scheme.primary),
                ),
                value: code,
                groupValue: selected,
                activeColor: scheme.primary,
                onChanged: (next) {
                  if (next == null) {
                    return;
                  }
                  Navigator.of(sheetContext).pop();
                  onSelected(next);
                },
              ),
            const SizedBox(height: LucyConstants.kSpacingMedium),
          ],
        ),
      );
    },
  );
}
