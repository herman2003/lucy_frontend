import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../utils/learning_session_error_translator.dart';
import '../../domain/entities/learning_session.dart';
import '../controllers/quiz_session_notifier.dart';
import '../controllers/quiz_session_state.dart';
import '../widgets/learning_session_source_chip.dart';

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
      appBar: AppBar(
        title: Text(state.session?.title ?? l10n.quizTitle),
      ),
      body: state.isLoading
          ? Center(child: Text(l10n.quizLoading))
          : !state.hasSession
          ? Center(
              child: Text(
                LearningSessionErrorTranslator.translate(
                  context,
                  state.errorCode ?? 'INTERNAL_ERROR',
                ),
              ),
            )
          : state.isComplete
          ? _ScoreView(state: state)
          : _QuestionView(
              sessionId: widget.sessionId,
              state: state,
            ),
    );
  }
}

class _QuestionView extends ConsumerWidget {
  const _QuestionView({required this.sessionId, required this.state});

  final String sessionId;
  final QuizSessionState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;
    final session = state.session!;
    final item = session.items[state.currentIndex];
    final questionNumber = state.currentIndex + 1;
    final selectedIndex = state.selectedAnswers[item.id];
    final hasAnswered = selectedIndex != null;

    return ListView(
      padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
      children: [
        Text(
          l10n.quizSessionProgress(questionNumber, state.totalQuestions),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: scheme.secondary,
          ),
        ),
        const SizedBox(height: LucyConstants.kSpacingMedium),
        Text(
          item.question ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: scheme.primary,
          ),
        ),
        const SizedBox(height: LucyConstants.kSpacingLarge),
        ...List.generate(item.choices?.length ?? 0, (index) {
          final choice = item.choices![index];
          return Padding(
            padding: const EdgeInsets.only(bottom: LucyConstants.kSpacingLow),
            child: _ChoiceTile(
              label: choice,
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
          const SizedBox(height: LucyConstants.kSpacingMedium),
          Text(
            selectedIndex == item.correctIndex
                ? l10n.quizSessionCorrect
                : l10n.quizSessionIncorrect,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: selectedIndex == item.correctIndex
                  ? scheme.primary
                  : scheme.error,
            ),
          ),
          const SizedBox(height: LucyConstants.kSpacingLow),
          Text(
            item.explanation ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (item.sources.isNotEmpty) ...[
            const SizedBox(height: LucyConstants.kSpacingMedium),
            Wrap(
              spacing: LucyConstants.kSpacingLow,
              runSpacing: LucyConstants.kSpacingLow,
              children: [
                for (final source in item.sources)
                  LearningSessionSourceChip(source: source),
              ],
            ),
          ],
          const SizedBox(height: LucyConstants.kSpacingLarge),
          LucyPrimaryButton(
            text: questionNumber == state.totalQuestions
                ? l10n.quizSessionFinish
                : l10n.quizSessionNextQuestion,
            onPressed: () =>
                ref.read(quizSessionProvider(sessionId).notifier).goToNextQuestion(),
          ),
        ],
      ],
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    required this.label,
    required this.selected,
    required this.revealed,
    required this.isCorrect,
    this.onTap,
  });

  final String label;
  final bool selected;
  final bool revealed;
  final bool isCorrect;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    Color? background;
    if (revealed && isCorrect) {
      background = scheme.primaryContainer;
    } else if (revealed && selected && !isCorrect) {
      background = scheme.errorContainer;
    } else if (selected) {
      background = scheme.secondaryContainer;
    }

    return Material(
      color: background ?? scheme.surface,
      borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(LucyConstants.kBorderRadiusMedium),
        child: Padding(
          padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: scheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _ScoreView extends StatelessWidget {
  const _ScoreView({required this.state});

  final QuizSessionState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
        child: Text(
          l10n.quizSessionScore(state.score, state.totalQuestions),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: scheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
