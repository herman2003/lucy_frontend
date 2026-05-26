import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/placeholders/lucy_under_development_page.dart';

/// Chat tab — future source-based tutor (SPEC §2, §3 P3).
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LucyUnderDevelopmentPage(title: context.l10n.chatTitle);
  }
}
