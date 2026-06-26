/// SM-2 review grades mapped to the 0–5 quality scale.
enum Sm2Quality {
  again(1),
  hard(3),
  good(4),
  easy(5);

  const Sm2Quality(this.value);

  final int value;
}

/// Local spaced-repetition state for one flashcard item.
class FlashcardSm2State {
  const FlashcardSm2State({
    required this.easeFactor,
    required this.repetitions,
    required this.intervalDays,
    required this.dueAt,
  });

  final double easeFactor;
  final int repetitions;
  final int intervalDays;
  final DateTime dueAt;

  FlashcardSm2State copyWith({
    double? easeFactor,
    int? repetitions,
    int? intervalDays,
    DateTime? dueAt,
  }) {
    return FlashcardSm2State(
      easeFactor: easeFactor ?? this.easeFactor,
      repetitions: repetitions ?? this.repetitions,
      intervalDays: intervalDays ?? this.intervalDays,
      dueAt: dueAt ?? this.dueAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'easeFactor': easeFactor,
    'repetitions': repetitions,
    'intervalDays': intervalDays,
    'dueAt': dueAt.toUtc().toIso8601String(),
  };

  factory FlashcardSm2State.fromJson(Map<String, dynamic> json) {
    return FlashcardSm2State(
      easeFactor: (json['easeFactor'] as num).toDouble(),
      repetitions: json['repetitions'] as int,
      intervalDays: json['intervalDays'] as int,
      dueAt: DateTime.parse(json['dueAt'] as String).toUtc(),
    );
  }
}
