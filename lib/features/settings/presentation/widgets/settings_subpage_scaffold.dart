import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';

/// Centered subpage layout for settings edits (telC pattern).
class SettingsSubpageScaffold extends StatelessWidget {
  const SettingsSubpageScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: scheme.primary)),
        backgroundColor: scheme.surface,
        foregroundColor: scheme.primary,
        iconTheme: IconThemeData(color: scheme.primary),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LucyConstants.kSettingsContentMaxWidth,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(
              LucyConstants.kContainerPaddingMedium,
            ),
            child: body,
          ),
        ),
      ),
    );
  }
}
