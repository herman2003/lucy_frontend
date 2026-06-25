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
import '../widgets/flashcard_widget.dart';
import '../widgets/learning_session_close_header.dart';
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
    final item = state.session!.items[state.currentIndex];
    final cardNumber = state.currentIndex + 1;
    final notifier = ref.read(flashcardsSessionProvider(sessionId).notifier);

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
          Wrap(
            spacing: LucySpacing.spaceSm,
            runSpacing: LucySpacing.spaceSm,
            children: [
              for (final source in item.sources)
                LearningSessionSourceChip(source: source),
            ],
          ),
        ],
        const SizedBox(height: LucySpacing.spaceLg + 2),
        Row(
          children: [
            Expanded(
              child: _FlashcardNavButton(
                label: l10n.flashcardsSessionPrevious,
                outlined: true,
                onPressed:
                    state.canGoPrevious ? notifier.goToPreviousCard : null,
              ),
            ),
            const SizedBox(width: LucySpacing.spaceMd),
            Expanded(
              child: _FlashcardNavButton(
                label: l10n.flashcardsSessionNext,
                outlined: false,
                onPressed: state.canGoNext ? notifier.goToNextCard : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FlashcardNavButton extends StatelessWidget {
  const _FlashcardNavButton({
    required this.label,
    required this.outlined,
    required this.onPressed,
  });

  final String label;
  final bool outlined;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = context.colorScheme;
    final lucy = context.lucyTheme;
    final enabled = onPressed != null;

    return Material(
      color: outlined ? scheme.surface : scheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium + 1),
        side: outlined
            ? BorderSide(
                color: enabled ? lucy.border : lucy.border.withValues(alpha: 0.5),
                width: 1.5,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(LucySpacing.radiusMedium + 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: LucySpacing.spaceMd + 1),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              color: outlined
                  ? (enabled ? lucy.muted : lucy.faint)
                  : scheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
