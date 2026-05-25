import 'package:flutter/material.dart';

import '../../extensions/context.dart';

/// Placeholder home until module IA (T08+).
class HomePlaceholderPage extends StatelessWidget {
  const HomePlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          context.l10n.appTitle,
          style: TextStyle(color: context.colorScheme.primary),
        ),
      ),
    );
  }
}
