import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../utils/quiz_library_generate_navigation.dart';

/// Quiz tab CTAs that start professor-mode generation via chat (LEARN-11e).
class QuizLibraryGenerateActions extends ConsumerWidget {
  const QuizLibraryGenerateActions({
    super.key,
    required this.enabled,
    this.compact = false,
  });

  final bool enabled;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    if (compact) {
      return Row(
        children: [
          Expanded(
            child: LucyPrimaryButton(
              text: l10n.quizLibraryGenerateQuiz,
              onPressed: enabled
                  ? () => openQuizGenerationInChat(
                        context: context,
                        ref: ref,
                        type: QuizLibraryGenerateType.quiz,
                      )
                  : null,
            ),
          ),
          const SizedBox(width: LucySpacing.spaceMd),
          Expanded(
            child: LucySecondaryButton(
              text: l10n.quizLibraryGenerateFlashcards,
              onPressed: enabled
                  ? () => openQuizGenerationInChat(
                        context: context,
                        ref: ref,
                        type: QuizLibraryGenerateType.flashcards,
                      )
                  : null,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LucyPrimaryButton(
          text: l10n.quizLibraryGenerateQuiz,
          onPressed: enabled
              ? () => openQuizGenerationInChat(
                    context: context,
                    ref: ref,
                    type: QuizLibraryGenerateType.quiz,
                  )
              : null,
        ),
        const SizedBox(height: LucySpacing.spaceMd),
        LucySecondaryButton(
          text: l10n.quizLibraryGenerateFlashcards,
          onPressed: enabled
              ? () => openQuizGenerationInChat(
                    context: context,
                    ref: ref,
                    type: QuizLibraryGenerateType.flashcards,
                  )
              : null,
        ),
      ],
    );
  }
}
