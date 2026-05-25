/// One confirmed onboarding turn stored in Firestore (SPEC §4.4).
class OnboardingTranscriptTurn {
  const OnboardingTranscriptTurn({
    required this.questionId,
    required this.questionText,
    required this.answerText,
    required this.confirmedAt,
  });

  final String questionId;
  final String questionText;
  final String answerText;
  final String confirmedAt;
}
