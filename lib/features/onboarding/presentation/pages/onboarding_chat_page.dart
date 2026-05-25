import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/router/lucy_route_paths.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../utils/onboarding_error_translator.dart';
import '../../utils/onboarding_question_ids.dart';
import '../controllers/onboarding_chat_notifier.dart';
import 'onboarding_chat/onboarding_chat_state.dart';
import '../widgets/onboarding_step_chat_panel.dart';
import '../widgets/onboarding_step_progress_dots.dart';

/// Onboarding shell: 7 isolated step chats with horizontal pager (SPEC §4.5.1, UX-1).
class OnboardingChatPage extends ConsumerStatefulWidget {
  const OnboardingChatPage({super.key});

  @override
  ConsumerState<OnboardingChatPage> createState() => _OnboardingChatPageState();
}

class _OnboardingChatPageState extends ConsumerState<OnboardingChatPage> {
  final _answerController = TextEditingController();
  late final PageController _pageController;
  int _viewingStepIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _answerController.addListener(_onAnswerControllerChanged);
  }

  @override
  void dispose() {
    _answerController.removeListener(_onAnswerControllerChanged);
    _answerController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onAnswerControllerChanged() {
    setState(() {});
  }

  void _syncPageToStep(int stepIndex) {
    if (!_pageController.hasClients) {
      return;
    }
    if (_pageController.page?.round() == stepIndex) {
      return;
    }
    _pageController.jumpToPage(stepIndex);
  }

  void _onStepSelected(int stepIndex, OnboardingChatState chatState) {
    if (!chatState.canNavigateToStepIndex(stepIndex)) {
      LucySnackBar.showError(
        context,
        message: context.l10n.onboardingStepLocked,
      );
      return;
    }
    setState(() => _viewingStepIndex = stepIndex);
    _pageController.animateToPage(
      stepIndex,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int stepIndex, OnboardingChatState chatState) {
    if (!chatState.canNavigateToStepIndex(stepIndex)) {
      _syncPageToStep(chatState.currentStepIndex);
      LucySnackBar.showError(
        context,
        message: context.l10n.onboardingStepLocked,
      );
      return;
    }
    setState(() => _viewingStepIndex = stepIndex);
  }

  bool _canSendAnswer(OnboardingChatState chatState) {
    if (_viewingStepIndex != chatState.currentStepIndex) {
      return false;
    }
    if (chatState.phase != OnboardingChatPhase.awaitingAnswer ||
        chatState.isSubmitting) {
      return false;
    }
    return _answerController.text.trim().isNotEmpty ||
        chatState.answerDraft.trim().isNotEmpty;
  }

  bool _showInputForStep(OnboardingChatState chatState) {
    return _viewingStepIndex == chatState.currentStepIndex &&
        !chatState.isAnalysisReady &&
        !chatState.isAwaitingRegenerateProfile;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;
    final chatState = ref.watch(onboardingChatProvider);
    final notifier = ref.read(onboardingChatProvider.notifier);

    ref.listen(onboardingChatProvider, (previous, next) {
      if (previous?.answerDraft != next.answerDraft &&
          next.answerDraft.isEmpty &&
          _answerController.text.isNotEmpty) {
        _answerController.clear();
      }
      if (next.isAnalysisReady && previous?.isAnalysisReady != true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          context.push(LucyRoutePaths.onboardingConfirm);
        });
      }
      if (previous?.currentStepIndex != next.currentStepIndex) {
        setState(() => _viewingStepIndex = next.currentStepIndex);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          _syncPageToStep(next.currentStepIndex);
        });
      }
    });

    if (!chatState.isInitialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        notifier.initialize(
          l10n: l10n,
          deviceLocale: Localizations.localeOf(context),
        );
        setState(() => _viewingStepIndex = 0);
      });
    }

    final stepNumber = chatState.currentStepIndex + 1;
    final isViewingCurrent = _viewingStepIndex == chatState.currentStepIndex;

    return Scaffold(
      backgroundColor: scheme.surface,
      appBar: AppBar(
        title: Text(
          l10n.onboardingStepProgress(stepNumber, OnboardingQuestionIds.stepCount),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            OnboardingStepProgressDots(
              stepStatusForIndex: chatState.stepStatus,
              onStepSelected: (index) => _onStepSelected(index, chatState),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnboardingQuestionIds.stepCount,
                onPageChanged: (index) => _onPageChanged(index, chatState),
                itemBuilder: (context, stepIndex) {
                  final showTyping = isViewingCurrent &&
                      stepIndex == chatState.currentStepIndex &&
                      chatState.showTypingIndicator;

                  final readOnly =
                      stepIndex < chatState.currentStepIndex;

                  return OnboardingStepChatPanel(
                    messages: chatState.messagesForStep(stepIndex),
                    showTypingIndicator: showTyping,
                    readOnly: readOnly,
                    onEditStep: readOnly
                        ? () {
                            notifier.beginEditCompletedStep(
                              stepIndex: stepIndex,
                              l10n: l10n,
                            );
                            setState(
                              () => _viewingStepIndex = stepIndex,
                            );
                            _syncPageToStep(stepIndex);
                          }
                        : null,
                  );
                },
              ),
            ),
            if (isViewingCurrent && chatState.showConfirmationActions)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: LucyConstants.kSpacingMedium,
                  vertical: LucyConstants.kSpacingLow,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: LucySecondaryButton(
                        text: l10n.onboardingRejectTurn,
                        onPressed: chatState.isSubmitting
                            ? null
                            : notifier.rejectTurnSummary,
                      ),
                    ),
                    const SizedBox(width: LucyConstants.kSpacingLow),
                    Expanded(
                      child: LucyPrimaryButton(
                        text: l10n.onboardingConfirmTurn,
                        isLoading: chatState.isSubmitting,
                        onPressed: chatState.isSubmitting
                            ? null
                            : () => _confirmTurn(context, l10n),
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            if (isViewingCurrent && chatState.isAwaitingRegenerateProfile)
              Padding(
                padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
                child: LucyPrimaryButton(
                  text: l10n.onboardingRegenerateProfile,
                  isLoading: chatState.isSubmitting,
                  onPressed: chatState.isSubmitting
                      ? null
                      : () => _regenerateProfile(context),
                  width: double.infinity,
                ),
              ),
            if (_showInputForStep(chatState))
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  LucyConstants.kSpacingMedium,
                  LucyConstants.kSpacingLow,
                  LucyConstants.kSpacingMedium,
                  LucyConstants.kSpacingMedium,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _answerController,
                        enabled:
                            chatState.phase ==
                                OnboardingChatPhase.awaitingAnswer &&
                            !chatState.isSubmitting,
                        maxLines: 4,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: l10n.onboardingAnswerHint,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              LucyConstants.kButtonBorderRadius,
                            ),
                          ),
                        ),
                        onChanged: notifier.updateAnswerDraft,
                      ),
                    ),
                    const SizedBox(width: LucyConstants.kSpacingLow),
                    LucyPrimaryButton(
                      text: l10n.onboardingSendAnswer,
                      isLoading: chatState.isSubmitting,
                      onPressed: _canSendAnswer(chatState)
                          ? () => _submit(context)
                          : null,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmTurn(BuildContext context, AppLocalizations l10n) async {
    try {
      await ref.read(onboardingChatProvider.notifier).confirmTurn(l10n);
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      LucySnackBar.showError(
        context,
        message: OnboardingErrorTranslator.fromException(context, error),
      );
    }
  }

  Future<void> _regenerateProfile(BuildContext context) async {
    try {
      await ref.read(onboardingChatProvider.notifier).regenerateProfile();
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      LucySnackBar.showError(
        context,
        message: OnboardingErrorTranslator.fromException(context, error),
      );
    }
  }

  Future<void> _submit(BuildContext context) async {
    ref
        .read(onboardingChatProvider.notifier)
        .updateAnswerDraft(_answerController.text);
    try {
      await ref.read(onboardingChatProvider.notifier).submitAnswer(context);
    } catch (error) {
      if (!context.mounted) {
        return;
      }
      LucySnackBar.showError(
        context,
        message: OnboardingErrorTranslator.fromException(context, error),
      );
    }
  }
}
