import '../../domain/entities/onboarding_completed_turn.dart';
import '../../domain/entities/onboarding_local_draft.dart';

abstract final class OnboardingLocalDraftMapper {
  static Map<String, dynamic> toJson(OnboardingLocalDraft draft) {
    return {
      'uid': draft.uid,
      'uiLocale': draft.uiLocale,
      'answerDraft': draft.answerDraft,
      'currentStepIndex': draft.currentStepIndex,
      'currentQuestionId': draft.currentQuestionId,
      'activeQuestionText': draft.activeQuestionText,
      'phaseName': draft.phaseName,
      'pendingTurnSummary': draft.pendingTurnSummary,
      'pendingAnswerText': draft.pendingAnswerText,
      'isFallbackConfirmation': draft.isFallbackConfirmation,
      'completedTurns': draft.completedTurns
          .map(
            (turn) => {
              'questionId': turn.questionId,
              'questionText': turn.questionText,
              'answerText': turn.answerText,
              'turnSummary': turn.turnSummary,
            },
          )
          .toList(),
    };
  }

  static OnboardingLocalDraft? fromJson(Map<String, dynamic> json) {
    final uid = json['uid'];
    if (uid is! String || uid.isEmpty) {
      return null;
    }

    final turnsRaw = json['completedTurns'];
    final turns = <OnboardingCompletedTurn>[];
    if (turnsRaw is List) {
      for (final entry in turnsRaw) {
        if (entry is! Map) {
          continue;
        }
        final map = Map<String, dynamic>.from(entry);
        final questionId = map['questionId'];
        final questionText = map['questionText'];
        final answerText = map['answerText'];
        final turnSummary = map['turnSummary'];
        if (questionId is! String ||
            questionText is! String ||
            answerText is! String ||
            turnSummary is! String) {
          continue;
        }
        turns.add(
          OnboardingCompletedTurn(
            questionId: questionId,
            questionText: questionText,
            answerText: answerText,
            turnSummary: turnSummary,
          ),
        );
      }
    }

    final stepIndex = json['currentStepIndex'];
    final questionId = json['currentQuestionId'];
    final activeText = json['activeQuestionText'];
    final phaseName = json['phaseName'];
    if (stepIndex is! int ||
        questionId is! String ||
        activeText is! String ||
        phaseName is! String) {
      return null;
    }

    return OnboardingLocalDraft(
      uid: uid,
      uiLocale: json['uiLocale'] is String ? json['uiLocale'] as String : 'de',
      answerDraft: json['answerDraft'] is String ? json['answerDraft'] as String : '',
      currentStepIndex: stepIndex,
      currentQuestionId: questionId,
      activeQuestionText: activeText,
      phaseName: phaseName,
      pendingTurnSummary: json['pendingTurnSummary'] as String?,
      pendingAnswerText: json['pendingAnswerText'] as String?,
      isFallbackConfirmation: json['isFallbackConfirmation'] == true,
      completedTurns: turns,
    );
  }
}
