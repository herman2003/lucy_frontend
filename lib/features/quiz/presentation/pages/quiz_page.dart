import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/placeholders/lucy_under_development_page.dart';

/// Quiz tab — future quizzes from user documents (SPEC §2, §3 P4).
class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LucyUnderDevelopmentPage(title: context.l10n.quizTitle);
  }
}
