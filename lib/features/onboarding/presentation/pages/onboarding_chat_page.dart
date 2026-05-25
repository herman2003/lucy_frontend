import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/lucy_constants.dart';
import '../../../../core/extensions/context.dart';
import '../../../../shared/widgets/buttons/lucy_primary_button.dart';
import '../../../../shared/widgets/buttons/lucy_secondary_button.dart';
import '../../../../shared/widgets/feedback/lucy_snackbar.dart';
import '../../utils/onboarding_error_translator.dart';
import '../../utils/onboarding_question_ids.dart';
import '../controllers/onboarding_chat_notifier.dart';
import 'onboarding_chat/onboarding_chat_state.dart';
import '../widgets/onboarding_lucy_bubble.dart';
import '../widgets/onboarding_lucy_typing_row.dart';
import '../widgets/onboarding_user_bubble.dart';

/// First onboarding chat step with validate-answer (SPEC §4.5.1, F05).
class OnboardingChatPage extends ConsumerStatefulWidget {
  const OnboardingChatPage({super.key});

  @override
  ConsumerState<OnboardingChatPage> createState() => _OnboardingChatPageState();
}

class _OnboardingChatPageState extends ConsumerState<OnboardingChatPage> {
  final _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _answerController.addListener(_onAnswerControllerChanged);
  }

  @override
  void dispose() {
    _answerController.removeListener(_onAnswerControllerChanged);
    _answerController.dispose();
    super.dispose();
  }

  void _onAnswerControllerChanged() {
    setState(() {});
  }

  bool _canSendAnswer(OnboardingChatState chatState) {
    if (chatState.phase != OnboardingChatPhase.awaitingAnswer ||
        chatState.isSubmitting) {
      return false;
    }
    return _answerController.text.trim().isNotEmpty ||
        chatState.answerDraft.trim().isNotEmpty;
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
      });
    }

    final stepNumber = chatState.currentStepIndex + 1;

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
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(LucyConstants.kSpacingMedium),
                itemCount:
                    chatState.messages.length +
                    (chatState.showTypingIndicator ? 1 : 0),
                separatorBuilder: (_, _) =>
                    const SizedBox(height: LucyConstants.kSpacingMedium),
                itemBuilder: (context, index) {
                  if (index >= chatState.messages.length) {
                    return const OnboardingLucyTypingRow();
                  }
                  final message = chatState.messages[index];
                  return message.isFromLucy
                      ? OnboardingLucyBubble(text: message.text)
                      : OnboardingUserBubble(text: message.text);
                },
              ),
            ),
            if (chatState.showConfirmationActions)
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
                        onPressed: chatState.isSubmitting
                            ? null
                            : notifier.confirmTurn,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
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
