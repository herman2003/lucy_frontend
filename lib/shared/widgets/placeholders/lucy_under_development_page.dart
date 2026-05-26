import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';

/// Scaffold with AppBar and centered [pageUnderDevelopment] message (SPEC §2).
class LucyUnderDevelopmentPage extends StatelessWidget {
  const LucyUnderDevelopmentPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            context.l10n.pageUnderDevelopment,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge?.copyWith(
              color: scheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
