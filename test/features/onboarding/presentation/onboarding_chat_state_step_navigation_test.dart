import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_chat_message.dart';
import 'package:lucy_frontend/features/onboarding/domain/entities/onboarding_completed_turn.dart';
import 'package:lucy_frontend/features/onboarding/presentation/pages/onboarding_chat/onboarding_chat_state.dart';
import 'package:lucy_frontend/features/onboarding/utils/onboarding_question_ids.dart';

void main() {
  group('OnboardingChatState step navigation', () {
    test('locks steps after currentStepIndex', () {
      const state = OnboardingChatState(
        isInitialized: true,
        currentStepIndex: 1,
        currentQuestionId: OnboardingQuestionIds.qDomains,
      );

      expect(state.canNavigateToStepIndex(0), isTrue);
      expect(state.canNavigateToStepIndex(1), isTrue);
      expect(state.canNavigateToStepIndex(2), isFalse);
    });

    test('messagesForStep returns only that step thread', () {
      const state = OnboardingChatState(
        isInitialized: true,
        currentStepIndex: 1,
        currentQuestionId: OnboardingQuestionIds.qDomains,
        messagesByQuestionId: {
          OnboardingQuestionIds.qRole: [
            OnboardingChatMessage(isFromLucy: true, text: 'Role?'),
          ],
          OnboardingQuestionIds.qDomains: [
            OnboardingChatMessage(isFromLucy: true, text: 'Domains?'),
            OnboardingChatMessage(isFromLucy: false, text: 'Math'),
          ],
        },
      );

      expect(state.messagesForStep(0), hasLength(1));
      expect(state.messagesForStep(1), hasLength(2));
      expect(state.messagesForStep(0).first.text, 'Role?');
      expect(state.stepStatus(0), OnboardingStepStatus.completed);
      expect(state.stepStatus(1), OnboardingStepStatus.current);
      expect(state.stepStatus(2), OnboardingStepStatus.locked);
    });

    test('completed step stays in map when advancing', () {
      const state = OnboardingChatState(
        isInitialized: true,
        currentStepIndex: 2,
        currentQuestionId: OnboardingQuestionIds.qGoal,
        messagesByQuestionId: {
          OnboardingQuestionIds.qRole: [
            OnboardingChatMessage(isFromLucy: true, text: 'Role done'),
          ],
          OnboardingQuestionIds.qDomains: [
            OnboardingChatMessage(isFromLucy: true, text: 'Domains done'),
          ],
          OnboardingQuestionIds.qGoal: [
            OnboardingChatMessage(isFromLucy: true, text: 'Goal?'),
          ],
        },
        completedTurns: [
          OnboardingCompletedTurn(
            questionId: OnboardingQuestionIds.qRole,
            questionText: 'Role',
            answerText: 'a',
            turnSummary: 's',
          ),
          OnboardingCompletedTurn(
            questionId: OnboardingQuestionIds.qDomains,
            questionText: 'Domains',
            answerText: 'b',
            turnSummary: 's',
          ),
        ],
      );

      expect(state.messagesForStep(0), isNotEmpty);
      expect(state.messagesForStep(1), isNotEmpty);
      expect(state.stepStatus(0), OnboardingStepStatus.completed);
    });
  });
}
