import 'package:flutter/material.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';

/// Centered subpage layout for settings edits.
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
    final lucy = context.lucyTheme;

    return Scaffold(
      backgroundColor: lucy.scaffoldBackground,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: lucy.scaffoldBackground,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LucyConstants.kSettingsContentMaxWidth,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(LucySpacing.spaceLg),
            child: body,
          ),
        ),
      ),
    );
  }
}
