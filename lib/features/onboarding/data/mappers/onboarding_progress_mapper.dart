import '../../domain/entities/onboarding_resume_progress.dart';
import '../../domain/entities/onboarding_transcript_turn.dart';
import 'pending_learner_profile_mapper.dart';

/// Maps Nest `GET /v1/onboarding/progress` JSON to [OnboardingResumeProgress].
abstract final class OnboardingProgressMapper {
  static OnboardingResumeProgress? fromApiJson(Map<String, dynamic> data) {
    final transcript = _parseTranscript(data['transcript']);
    final status = data['onboardingStatus'];
    final onboardingStatus = status is String ? status : 'in_progress';
    final pendingProfile =
        PendingLearnerProfileMapper.fromFirestore(data['pendingLearnerProfile']);
    final pendingSummary = data['pendingSummaryForUser'];
    final pendingSummaryForUser =
        pendingSummary is String && pendingSummary.trim().isNotEmpty
            ? pendingSummary.trim()
            : null;

    if (transcript.isEmpty &&
        onboardingStatus != 'awaiting_final_confirm' &&
        pendingProfile == null) {
      return null;
    }

    return OnboardingResumeProgress(
      onboardingStatus: onboardingStatus,
      transcript: transcript,
      pendingLearnerProfile: pendingProfile,
      pendingSummaryForUser: pendingSummaryForUser,
    );
  }

  static List<OnboardingTranscriptTurn> _parseTranscript(Object? raw) {
    if (raw is! List) {
      return const [];
    }

    final turns = <OnboardingTranscriptTurn>[];
    for (final entry in raw) {
      if (entry is! Map) {
        continue;
      }
      final map = Map<String, dynamic>.from(entry);
      final questionId = map['questionId'];
      final questionText = map['questionText'];
      final answerText = map['answerText'];
      final confirmedAt = map['confirmedAt'];
      if (questionId is! String ||
          questionText is! String ||
          answerText is! String ||
          confirmedAt is! String) {
        continue;
      }
      turns.add(
        OnboardingTranscriptTurn(
          questionId: questionId,
          questionText: questionText,
          answerText: answerText,
          confirmedAt: confirmedAt,
        ),
      );
    }
    return turns;
  }
}
