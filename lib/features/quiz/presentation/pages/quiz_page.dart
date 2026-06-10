import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../shared/widgets/buttons/lucy_tertiary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../utils/learning_session_error_translator.dart';
import '../../utils/quiz_error_translator.dart';
import '../controllers/quiz_notifier.dart';
import '../widgets/quiz_library_empty_state.dart';
import '../widgets/quiz_library_history_header.dart';
import '../widgets/quiz_no_corpus_banner.dart';
import '../widgets/quiz_session_list_tile.dart';

/// Quiz tab — session library (SPEC learning G2, G12).
class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (!mounted) {
        return;
      }
      ref.read(quizProvider.notifier).bootstrap();
    });
  }

  String _translateError(BuildContext context, String code) {
    if (code.startsWith('LEARNING_')) {
      return LearningSessionErrorTranslator.translate(context, code);
    }
    return QuizErrorTranslator.translate(context, code);
  }

  Future<bool> _confirmDeleteSession(LearningSessionListItem session) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.quizLibraryDeleteConfirmTitle),
        content: Text(l10n.quizLibraryDeleteConfirmMessage(session.title)),
        actions: [
          LucyTertiaryButton(
            text: l10n.quizLibraryDeleteCancel,
            onPressed: () => Navigator.of(dialogContext).pop(false),
          ),
          LucyTertiaryButton(
            text: l10n.quizLibraryDeleteAction,
            onPressed: () => Navigator.of(dialogContext).pop(true),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) {
      return false;
    }
    return ref.read(quizProvider.notifier).deleteSession(session.id);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider);
    final l10n = context.l10n;

    ref.listen(quizProvider, (previous, next) {
      if (next.errorCode != null && next.errorCode != previous?.errorCode) {
        LucySnackBar.showError(
          context,
          message: _translateError(context, next.errorCode!),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.quizTitle)),
      body: state.isLoading
          ? Center(child: Text(l10n.quizLoading))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!state.canQuiz && state.eligibility != null)
                  const QuizNoCorpusBanner(),
                Expanded(
                  child: state.sessions.isEmpty
                      ? const QuizLibraryEmptyState()
                      : ListView.builder(
                          itemCount: state.sessions.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return const QuizLibraryHistoryHeader();
                            }
                            final session = state.sessions[index - 1];
                            final scheme = Theme.of(context).colorScheme;
                            return Dismissible(
                              key: ValueKey(session.id),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(
                                  right: LucyConstants.kSpacingLarge,
                                ),
                                color: scheme.errorContainer,
                                child: Icon(
                                  Icons.delete_outline,
                                  color: scheme.onErrorContainer,
                                ),
                              ),
                              confirmDismiss: (_) => _confirmDeleteSession(session),
                              child: QuizSessionListTile(
                                session: session,
                                onTap: () => context.push(
                                  LucyRoutePaths.quizSession(session.id),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
