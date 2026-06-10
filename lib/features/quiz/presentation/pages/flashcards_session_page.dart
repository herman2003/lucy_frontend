import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/learning_session.dart';
import '../../utils/learning_session_error_translator.dart';
import '../controllers/flashcards_session_notifier.dart';
import '../controllers/flashcards_session_state.dart';
import '../widgets/flashcard_widget.dart';
import '../widgets/learning_session_source_chip.dart';

class FlashcardsSessionPage extends ConsumerStatefulWidget {
  const FlashcardsSessionPage({
    super.key,
    required this.sessionId,
    this.initialSession,
  });

  final String sessionId;
  final LearningSession? initialSession;

  @override
  ConsumerState<FlashcardsSessionPage> createState() =>
      _FlashcardsSessionPageState();
}

class _FlashcardsSessionPageState extends ConsumerState<FlashcardsSessionPage> {
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
            .read(flashcardsSessionProvider(widget.sessionId).notifier)
            .seedSession(initialSession);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(flashcardsSessionProvider(widget.sessionId));
    final l10n = context.l10n;

    ref.listen(flashcardsSessionProvider(widget.sessionId), (previous, next) {
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
          : _FlashcardsContent(
              sessionId: widget.sessionId,
              state: state,
            ),
    );
  }
}

class _FlashcardsContent extends ConsumerWidget {
  const _FlashcardsContent({
    required this.sessionId,
    required this.state,
  });

  final String sessionId;
  final FlashcardsSessionState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final item = state.session!.items[state.currentIndex];
    final cardNumber = state.currentIndex + 1;
    final notifier = ref.read(flashcardsSessionProvider(sessionId).notifier);

    return ListView(
      padding: const EdgeInsets.all(LucyConstants.kSpacingLarge),
      children: [
        Text(
          l10n.flashcardsSessionProgress(cardNumber, state.totalCards),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(height: LucyConstants.kSpacingLarge),
        FlashcardWidget(
          front: item.front ?? '',
          back: item.back ?? '',
          isFlipped: state.isFlipped,
          onFlip: notifier.toggleFlip,
        ),
        if (item.sources.isNotEmpty) ...[
          const SizedBox(height: LucyConstants.kSpacingLarge),
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
        Row(
          children: [
            Expanded(
              child: LucySecondaryButton(
                text: l10n.flashcardsSessionPrevious,
                onPressed: state.canGoPrevious ? notifier.goToPreviousCard : null,
              ),
            ),
            const SizedBox(width: LucyConstants.kSpacingMedium),
            Expanded(
              child: LucySecondaryButton(
                text: l10n.flashcardsSessionNext,
                onPressed: state.canGoNext ? notifier.goToNextCard : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
