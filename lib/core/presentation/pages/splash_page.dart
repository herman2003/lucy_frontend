import 'package:flutter/material.dart';

import '../../extensions/context.dart';

/// Bootstrap screen until auth routing is wired (T06).
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.appTitle,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            CircularProgressIndicator(
              color: context.colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.splashLoading,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
