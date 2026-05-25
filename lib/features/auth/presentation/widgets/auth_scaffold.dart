import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_responsive.dart';
import 'auth_mobile_layout.dart';
import 'auth_web_layout.dart';

/// Picks web or mobile auth layout from viewport (no OAuth section).
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.formContent,
    required this.brandingTitle,
    required this.brandingSubtitle,
    this.formKey,
  });

  final List<Widget> formContent;
  final String brandingTitle;
  final String brandingSubtitle;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    if (context.isDesktop) {
      return AuthWebLayout(
        formContent: formContent,
        brandingTitle: brandingTitle,
        brandingSubtitle: brandingSubtitle,
        formKey: formKey,
      );
    }

    return AuthMobileLayout(
      formContent: formContent,
      formKey: formKey,
    );
  }
}
