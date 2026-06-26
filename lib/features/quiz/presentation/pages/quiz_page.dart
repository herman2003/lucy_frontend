import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/constants/lucy_spacing.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/signals/quiz_library_refresh_signal.dart';
import '../../../../core/constants/responsive_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/theme/lucy_theme_extensions.dart';
import '../../../../shared/widgets/buttons/lucy_tertiary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../domain/entities/learning_session_list_item.dart';
import '../../utils/learning_session_error_translator.dart';
import '../../utils/quiz_error_translator.dart';
import '../controllers/quiz_notifier.dart';
import '../widgets/quiz_library_generate_actions.dart';
import '../widgets/quiz_library_empty_state.dart';
import '../widgets/quiz_no_corpus_banner.dart';
import '../widgets/quiz_page_header.dart';
import '../widgets/quiz_session_card.dart';
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

  void _openSession(LearningSessionListItem session) {
    context.push(LucyRoutePaths.quizSession(session.id));
  }

  Future<void> _deleteSession(LearningSessionListItem session) async {
    await _confirmDeleteSession(session);
  }

  bool _useCardGrid(BuildContext context) {
    return MediaQuery.sizeOf(context).width >=
        ResponsiveConstants.kTabletBreakpoint;
  }

  Widget _buildPhoneList(List<LearningSessionListItem> sessions) {
    return RefreshIndicator(
      onRefresh: () => ref.read(quizProvider.notifier).refreshSessions(),
      child: ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: LucySpacing.spaceLg,
        vertical: LucySpacing.spaceXl,
      ),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        final scheme = Theme.of(context).colorScheme;
        return Dismissible(
          key: ValueKey(session.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: LucySpacing.spaceXl),
            color: scheme.errorContainer,
            child: Icon(Icons.delete_outline, color: scheme.onErrorContainer),
          ),
          confirmDismiss: (_) => _confirmDeleteSession(session),
          child: QuizSessionListTile(
            session: session,
            lastAttempt: ref.watch(quizProvider).lastQuizAttempts[session.id],
            onTap: () => _openSession(session),
          ),
        );
      },
      ),
    );
  }

  Widget _buildTabletGrid(List<LearningSessionListItem> sessions) {
    return RefreshIndicator(
      onRefresh: () => ref.read(quizProvider.notifier).refreshSessions(),
      child: CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(
            LucySpacing.space2xl,
            LucySpacing.spaceXl,
            LucySpacing.space2xl,
            LucySpacing.spaceXl,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: LucyConstants.kQuizLibraryGridMaxExtent,
              mainAxisSpacing: LucySpacing.spaceLg + 2,
              crossAxisSpacing: LucySpacing.spaceLg + 2,
              childAspectRatio: LucyConstants.kQuizLibraryGridAspectRatio,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final session = sessions[index];
              return QuizSessionCard(
                session: session,
                lastAttempt: ref.watch(quizProvider).lastQuizAttempts[session.id],
                onTap: () => _openSession(session),
                onDelete: () => _deleteSession(session),
              );
            }, childCount: sessions.length),
          ),
        ),
      ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizProvider);
    final l10n = context.l10n;

    ref.listen(quizLibraryRefreshSignalProvider, (previous, next) {
      if (previous != next) {
        ref.read(quizProvider.notifier).refreshSessions();
      }
    });

    ref.listen(
      lucyRouterProvider.select((router) => router.state.matchedLocation),
      (previous, next) {
        if (next != LucyRoutePaths.quiz) {
          return;
        }
        final cameFromSession =
            previous?.startsWith('${LucyRoutePaths.quiz}/session/') ?? false;
        if (cameFromSession) {
          ref.read(quizProvider.notifier).refreshSessions();
        }
      },
    );

    ref.listen(quizProvider, (previous, next) {
      if (next.errorCode != null && next.errorCode != previous?.errorCode) {
        LucySnackBar.showError(
          context,
          message: _translateError(context, next.errorCode!),
        );
      }
    });

    return Scaffold(
      backgroundColor: context.lucyTheme.scaffoldBackground,
      body: state.isLoading
          ? Center(child: Text(l10n.quizLoading))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const QuizPageHeader(),
                if (state.canQuiz && state.sessions.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      LucySpacing.spaceLg,
                      0,
                      LucySpacing.spaceLg,
                      LucySpacing.spaceMd,
                    ),
                    child: QuizLibraryGenerateActions(
                      enabled: state.canQuiz,
                      compact: _useCardGrid(context),
                    ),
                  ),
                if (!state.canQuiz && state.eligibility != null)
                  const QuizNoCorpusBanner(),
                Expanded(
                  child: state.sessions.isEmpty
                      ? QuizLibraryEmptyState(canGenerate: state.canQuiz)
                      : _useCardGrid(context)
                      ? _buildTabletGrid(state.sessions)
                      : _buildPhoneList(state.sessions),
                ),
              ],
            ),
    );
  }
}
