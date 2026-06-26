/// One completed quiz run for a learning session (LEARN-12b).
class QuizAttempt {
  const QuizAttempt({
    required this.id,
    required this.sessionId,
    required this.startedAt,
    required this.completedAt,
    required this.scoreCorrect,
    required this.scoreTotal,
    required this.answers,
  });

  final String id;
  final String sessionId;
  final DateTime startedAt;
  final DateTime completedAt;
  final int scoreCorrect;
  final int scoreTotal;
  final List<QuizAttemptAnswer> answers;

  Map<String, dynamic> toJson() => {
    'id': id,
    'sessionId': sessionId,
    'startedAt': startedAt.toUtc().toIso8601String(),
    'completedAt': completedAt.toUtc().toIso8601String(),
    'scoreCorrect': scoreCorrect,
    'scoreTotal': scoreTotal,
    'answers': answers.map((answer) => answer.toJson()).toList(),
  };

  factory QuizAttempt.fromJson(Map<String, dynamic> json) {
    final rawAnswers = json['answers'];
    return QuizAttempt(
      id: json['id'] as String,
      sessionId: json['sessionId'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String).toUtc(),
      completedAt: DateTime.parse(json['completedAt'] as String).toUtc(),
      scoreCorrect: json['scoreCorrect'] as int,
      scoreTotal: json['scoreTotal'] as int,
      answers: rawAnswers is List
          ? [
              for (final entry in rawAnswers)
                if (entry is Map<String, dynamic>)
                  QuizAttemptAnswer.fromJson(entry),
            ]
          : const [],
    );
  }
}

class QuizAttemptAnswer {
  const QuizAttemptAnswer({
    required this.itemId,
    required this.selectedIndex,
    required this.correctIndex,
    required this.isCorrect,
  });

  final String itemId;
  final int selectedIndex;
  final int correctIndex;
  final bool isCorrect;

  Map<String, dynamic> toJson() => {
    'itemId': itemId,
    'selectedIndex': selectedIndex,
    'correctIndex': correctIndex,
    'isCorrect': isCorrect,
  };

  factory QuizAttemptAnswer.fromJson(Map<String, dynamic> json) {
    return QuizAttemptAnswer(
      itemId: json['itemId'] as String,
      selectedIndex: json['selectedIndex'] as int,
      correctIndex: json['correctIndex'] as int,
      isCorrect: json['isCorrect'] as bool,
    );
  }
}
