import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/placeholders/lucy_under_development_page.dart';

/// Documents tab — future upload / RAG corpus (SPEC §2, §3 P1).
class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LucyUnderDevelopmentPage(title: context.l10n.documentsTitle);
  }
}
