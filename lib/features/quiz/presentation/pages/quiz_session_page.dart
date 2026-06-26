import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_colors.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/learning_session.dart';
import '../../domain/entities/learning_session_source.dart';
import '../../utils/learning_session_error_translator.dart';
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
      backgroundColor: context.lucyTheme.scaffoldBackground,
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
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final session = state.session!;
    final item = session.items[state.currentIndex];
    final questionNumber = state.currentIndex + 1;
    final selectedIndex = state.selectedAnswers[item.id];
    final hasAnswered = selectedIndex != null;
    final isCorrect = selectedIndex == item.correctIndex;

    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(LucySpacing.spaceXl),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LucyConstants.kQuizContentMaxWidth,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: scheme.surface,
              borderRadius: BorderRadius.circular(LucySpacing.radiusLarge),
              border: Border.all(color: lucy.border),
            ),
            child: Padding(
              padding: const EdgeInsets.all(LucySpacing.spaceXl + 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  QuizProgressHeader(
                    current: questionNumber,
                    total: state.totalQuestions,
                    onClose: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(height: LucySpacing.spaceXl),
                  Text(
                    item.question ?? '',
                    style: context.textTheme.headlineSmall?.copyWith(
                      color: scheme.onSurface,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: LucySpacing.spaceLg + 2),
                  ...List.generate(item.choices?.length ?? 0, (index) {
                    final choice = item.choices![index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: LucySpacing.spaceMd - 1,
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
                    _FeedbackPanel(
                      isCorrect: isCorrect,
                      explanation: item.explanation ?? '',
                      sources: item.sources,
                    ),
                    const SizedBox(height: LucySpacing.spaceLg),
                    Material(
                      color: scheme.primary,
                      borderRadius: BorderRadius.circular(
                        LucySpacing.radiusMedium,
                      ),
                      child: InkWell(
                        onTap: () => ref
                            .read(quizSessionProvider(sessionId).notifier)
                            .goToNextQuestion(),
                        borderRadius: BorderRadius.circular(
                          LucySpacing.radiusMedium,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: LucySpacing.spaceMd + 1,
                          ),
                          child: Text(
                            questionNumber == state.totalQuestions
                                ? l10n.quizSessionFinish
                                : l10n.quizSessionNextQuestion,
                            textAlign: TextAlign.center,
                            style: context.textTheme.labelLarge?.copyWith(
                              color: scheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
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
    final lucy = context.lucyTheme;
    final panelColor = isCorrect
        ? lucy.tealChipBackground
        : LucyColors.quizIncorrectBackground;
    final onPanelColor = isCorrect
        ? lucy.tealChipForeground
        : LucyColors.quizIncorrectForeground;
    final verdict = isCorrect
        ? l10n.quizSessionCorrect
        : l10n.quizSessionIncorrect;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: LucySpacing.spaceLg),
      padding: const EdgeInsets.symmetric(
        horizontal: LucySpacing.spaceMd + 3,
        vertical: LucySpacing.spaceMd,
      ),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$verdict ',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: onPanelColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (explanation.isNotEmpty)
                  TextSpan(
                    text: explanation,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: onPanelColor,
                      height: 1.45,
                    ),
                  ),
              ],
            ),
          ),
          if (sources.isNotEmpty) ...[
            const SizedBox(height: LucySpacing.spaceMd),
            Wrap(
              spacing: LucySpacing.spaceSm,
              runSpacing: LucySpacing.spaceSm,
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
