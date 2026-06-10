import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';

/// Bottom sheet for a single enum choice (telC language sheet pattern).
Future<void> showSettingsSingleChoiceSheet({
  required BuildContext context,
  required String title,
  required List<String> options,
  required String selectedValue,
  required String Function(String value) labelForValue,
  required ValueChanged<String> onSelected,
}) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    builder: (sheetContext) {
      final scheme = Theme.of(sheetContext).colorScheme;

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
                title,
                style: Theme.of(sheetContext).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: scheme.primary,
                ),
              ),
            ),
            for (final value in options)
              RadioListTile<String>(
                title: Text(
                  labelForValue(value),
                  style: TextStyle(color: scheme.primary),
                ),
                value: value,
                groupValue: selectedValue,
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
