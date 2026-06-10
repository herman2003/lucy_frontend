import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/learning_session_type.dart';
import '../../utils/learning_session_error_translator.dart';
import '../controllers/learning_session_route_notifier.dart';
import 'flashcards_session_page.dart';
import 'quiz_session_page.dart';

/// Routes `/quiz/session/:sessionId` to quiz or flashcards practice (SPEC §4.5).
class LearningSessionPage extends ConsumerWidget {
  const LearningSessionPage({super.key, required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final routeAsync = ref.watch(learningSessionRouteProvider(sessionId));

    ref.listen(learningSessionRouteProvider(sessionId), (previous, next) {
      if (next.hasError && next.error != previous?.error) {
        LucySnackBar.showError(
          context,
          message: LearningSessionErrorTranslator.translate(
            context,
            'LEARNING_SESSION_NOT_FOUND',
          ),
        );
      }
    });

    return routeAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: Text(l10n.quizTitle)),
        body: Center(child: Text(l10n.quizLoading)),
      ),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(title: Text(l10n.quizTitle)),
        body: Center(
          child: Text(
            LearningSessionErrorTranslator.translate(
              context,
              'LEARNING_SESSION_NOT_FOUND',
            ),
          ),
        ),
      ),
      data: (session) {
        if (session.type == LearningSessionType.flashcards) {
          return FlashcardsSessionPage(
            sessionId: sessionId,
            initialSession: session,
          );
        }
        return QuizSessionPage(
          sessionId: sessionId,
          initialSession: session,
        );
      },
    );
  }
}
