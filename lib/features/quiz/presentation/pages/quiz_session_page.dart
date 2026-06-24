import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../utils/learning_session_error_translator.dart';
import '../../domain/entities/learning_session.dart';
import '../../domain/entities/learning_session_source.dart';
import '../controllers/quiz_session_notifier.dart';
import '../controllers/quiz_session_state.dart';
import '../widgets/learning_session_source_chip.dart';
import '../widgets/quiz_choice_tile.dart';
import '../widgets/quiz_progress_header.dart';
import '../widgets/quiz_score_summary.dart';

class QuizSessionPage extends ConsumerStatefulWidget {
  const QuizSessionPage({
    super.key,
    required this.sessionId,
    this.initialSession,
  });

  final String sessionId;
  final LearningSession? initialSession;

  @override
  ConsumerState<QuizSessionPage> createState() => _QuizSessionPageState();
}

class _QuizSessionPageState extends ConsumerState<QuizSessionPage> {
  @override
  void initState() {
    super.initState();
    final initialSession = widget.initialSession;
    if (initialSession != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref
            .read(quizSessionProvider(widget.sessionId).notifier)
            .seedSession(initialSession);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizSessionProvider(widget.sessionId));
    final l10n = context.l10n;
    final notifier = ref.read(quizSessionProvider(widget.sessionId).notifier);

    ref.listen(quizSessionProvider(widget.sessionId), (previous, next) {
      if (next.errorCode != null && next.errorCode != previous?.errorCode) {
        LucySnackBar.showError(
          context,
          message: LearningSessionErrorTranslator.translate(
            context,
            next.errorCode!,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(state.session?.title ?? l10n.quizTitle)),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : !state.hasSession
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
                child: Text(
                  LearningSessionErrorTranslator.translate(
                    context,
                    state.errorCode ?? 'INTERNAL_ERROR',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : state.isComplete
          ? Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: LucyConstants.kQuizContentMaxWidth,
                ),
                child: QuizScoreSummary(
                  state: state,
                  onClose: () => Navigator.of(context).pop(),
                  onRetry: notifier.restart,
                ),
              ),
            )
          : _QuestionView(sessionId: widget.sessionId, state: state),
    );
  }
}

class _QuestionView extends ConsumerWidget {
  const _QuestionView({required this.sessionId, required this.state});

  final String sessionId;
  final QuizSessionState state;

  String _choiceLetter(int index) => String.fromCharCode(65 + index);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;
    final session = state.session!;
    final item = session.items[state.currentIndex];
    final questionNumber = state.currentIndex + 1;
    final selectedIndex = state.selectedAnswers[item.id];
    final hasAnswered = selectedIndex != null;
    final isCorrect = selectedIndex == item.correctIndex;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: LucyConstants.kQuizContentMaxWidth,
        ),
        child: ListView(
          padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
          children: [
            QuizProgressHeader(
              current: questionNumber,
              total: state.totalQuestions,
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
            Card(
              elevation: 0,
              color: scheme.surfaceContainerLow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  LucyConstants.kBorderRadiusLarge,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
                child: Text(
                  item.question ?? '',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
                ),
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLarge),
            ...List.generate(item.choices?.length ?? 0, (index) {
              final choice = item.choices![index];
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: LucyConstants.kSpacingMedium,
                ),
                child: QuizChoiceTile(
                  label: choice,
                  letter: _choiceLetter(index),
                  selected: selectedIndex == index,
                  revealed: hasAnswered,
                  isCorrect: index == item.correctIndex,
                  onTap: hasAnswered
                      ? null
                      : () => ref
                            .read(quizSessionProvider(sessionId).notifier)
                            .selectAnswer(item.id, index),
                ),
              );
            }),
            if (hasAnswered) ...[
              const SizedBox(height: LucyConstants.kSpacingLow),
              _FeedbackPanel(
                isCorrect: isCorrect,
                explanation: item.explanation ?? '',
                sources: item.sources,
              ),
              const SizedBox(height: LucyConstants.kSpacingLarge),
              LucyPrimaryButton(
                text: questionNumber == state.totalQuestions
                    ? l10n.quizSessionFinish
                    : l10n.quizSessionNextQuestion,
                onPressed: () => ref
                    .read(quizSessionProvider(sessionId).notifier)
                    .goToNextQuestion(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _FeedbackPanel extends StatelessWidget {
  const _FeedbackPanel({
    required this.isCorrect,
    required this.explanation,
    required this.sources,
  });

  final bool isCorrect;
  final String explanation;
  final List<LearningSessionSource> sources;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;
    final panelColor = isCorrect
        ? scheme.primaryContainer
        : scheme.errorContainer;
    final onPanelColor = isCorrect
        ? scheme.onPrimaryContainer
        : scheme.onErrorContainer;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle_outline : Icons.info_outline,
                color: onPanelColor,
              ),
              const SizedBox(width: LucyConstants.kSpacingLow),
              Text(
                isCorrect ? l10n.quizSessionCorrect : l10n.quizSessionIncorrect,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: onPanelColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (explanation.isNotEmpty) ...[
            const SizedBox(height: LucyConstants.kSpacingMedium),
            Text(
              l10n.quizSessionExplanationTitle,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: onPanelColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: LucyConstants.kSpacingLow),
            Text(
              explanation,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: onPanelColor),
            ),
          ],
          if (sources.isNotEmpty) ...[
            const SizedBox(height: LucyConstants.kSpacingMedium),
            Wrap(
              spacing: LucyConstants.kSpacingLow,
              runSpacing: LucyConstants.kSpacingLow,
              children: [
                for (final source in sources)
                  LearningSessionSourceChip(source: source),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
