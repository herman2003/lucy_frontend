import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/learning_session.dart';
import '../../utils/learning_session_error_translator.dart';
import '../controllers/flashcards_session_notifier.dart';
import '../controllers/flashcards_session_state.dart';
import '../widgets/flashcard_rating_bar.dart';
import '../widgets/flashcard_widget.dart';
import '../widgets/learning_session_close_header.dart';
import '../widgets/learning_session_item_sources.dart';

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
      backgroundColor: context.lucyTheme.scaffoldBackground,
      body: state.isLoading
          ? Center(child: Text(l10n.quizLoading))
          : !state.hasSession
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(LucySpacing.spaceXl),
                child: Text(
                  LearningSessionErrorTranslator.translate(
                    context,
                    state.errorCode ?? 'INTERNAL_ERROR',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: LucyConstants.kFlashcardsContentMaxWidth,
                ),
                child: _FlashcardsContent(
                  sessionId: widget.sessionId,
                  state: state,
                ),
              ),
            ),
    );
  }
}

class _FlashcardsContent extends ConsumerWidget {
  const _FlashcardsContent({required this.sessionId, required this.state});

  final String sessionId;
  final FlashcardsSessionState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final notifier = ref.read(flashcardsSessionProvider(sessionId).notifier);

    if (state.isSessionComplete) {
      return ListView(
        padding: const EdgeInsets.all(LucySpacing.spaceXl),
        children: [
          LearningSessionCloseHeader(
            progressLabel: l10n.flashcardsSessionProgress(
              state.totalCards,
              state.totalCards,
            ),
            onClose: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: LucySpacing.spaceXl),
          Text(
            l10n.flashcardsSessionCompleteTitle,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(height: LucySpacing.spaceSm),
          Text(
            l10n.flashcardsSessionCompleteMessage,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.lucyTheme.muted,
            ),
          ),
        ],
      );
    }

    final item = state.session!.items[state.currentIndex];
    final cardNumber = state.queuePosition + 1;

    return ListView(
      padding: const EdgeInsets.all(LucySpacing.spaceXl),
      children: [
        LearningSessionCloseHeader(
          progressLabel: l10n.flashcardsSessionProgress(
            cardNumber,
            state.totalCards,
          ),
          onClose: () => Navigator.of(context).pop(),
        ),
        const SizedBox(height: LucySpacing.spaceLg),
        FlashcardWidget(
          front: item.front ?? '',
          back: item.back ?? '',
          isFlipped: state.isFlipped,
          onFlip: notifier.toggleFlip,
        ),
        if (item.sources.isNotEmpty) ...[
          const SizedBox(height: LucySpacing.spaceLg),
          LearningSessionItemSources(sources: item.sources),
        ],
        const SizedBox(height: LucySpacing.spaceLg + 2),
        if (state.isFlipped && state.awaitingRating)
          FlashcardRatingBar(onRated: notifier.rateCard),
      ],
    );
  }
}
