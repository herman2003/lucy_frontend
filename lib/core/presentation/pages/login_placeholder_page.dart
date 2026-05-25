import 'package:flutter/material.dart';

import '../../extensions/context.dart';

/// Placeholder until [LoginPage] (T08).
class LoginPlaceholderPage extends StatelessWidget {
  const LoginPlaceholderPage({super.key});

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
