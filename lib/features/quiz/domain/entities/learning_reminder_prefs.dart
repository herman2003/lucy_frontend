/// User preferences for learning reminders (LEARN-12a-3).
class LearningReminderPrefs {
  const LearningReminderPrefs({
    required this.enabled,
    required this.reminderHour,
    required this.reminderMinute,
    required this.flashcardsDue,
    required this.revisionPlanEnabled,
    required this.weakQuizEnabled,
  });

  static const defaults = LearningReminderPrefs(
    enabled: false,
    reminderHour: 18,
    reminderMinute: 0,
    flashcardsDue: true,
    revisionPlanEnabled: true,
    weakQuizEnabled: true,
  );

  final bool enabled;
  final int reminderHour;
  final int reminderMinute;
  final bool flashcardsDue;
  final bool revisionPlanEnabled;
  final bool weakQuizEnabled;

  LearningReminderPrefs copyWith({
    bool? enabled,
    int? reminderHour,
    int? reminderMinute,
    bool? flashcardsDue,
    bool? revisionPlanEnabled,
    bool? weakQuizEnabled,
  }) {
    return LearningReminderPrefs(
      enabled: enabled ?? this.enabled,
      reminderHour: reminderHour ?? this.reminderHour,
      reminderMinute: reminderMinute ?? this.reminderMinute,
      flashcardsDue: flashcardsDue ?? this.flashcardsDue,
      revisionPlanEnabled: revisionPlanEnabled ?? this.revisionPlanEnabled,
      weakQuizEnabled: weakQuizEnabled ?? this.weakQuizEnabled,
    );
  }

  Map<String, dynamic> toJson() => {
    'enabled': enabled,
    'reminderHour': reminderHour,
    'reminderMinute': reminderMinute,
    'flashcardsDue': flashcardsDue,
    'revisionPlanEnabled': revisionPlanEnabled,
    'weakQuizEnabled': weakQuizEnabled,
  };

  factory LearningReminderPrefs.fromJson(Map<String, dynamic> json) {
    return LearningReminderPrefs(
      enabled: json['enabled'] as bool? ?? defaults.enabled,
      reminderHour: json['reminderHour'] as int? ?? defaults.reminderHour,
      reminderMinute: json['reminderMinute'] as int? ?? defaults.reminderMinute,
      flashcardsDue: json['flashcardsDue'] as bool? ?? defaults.flashcardsDue,
      revisionPlanEnabled:
          json['revisionPlanEnabled'] as bool? ?? defaults.revisionPlanEnabled,
      weakQuizEnabled:
          json['weakQuizEnabled'] as bool? ?? defaults.weakQuizEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is LearningReminderPrefs &&
            enabled == other.enabled &&
            reminderHour == other.reminderHour &&
            reminderMinute == other.reminderMinute &&
            flashcardsDue == other.flashcardsDue &&
            revisionPlanEnabled == other.revisionPlanEnabled &&
            weakQuizEnabled == other.weakQuizEnabled;
  }

  @override
  int get hashCode => Object.hash(
    enabled,
    reminderHour,
    reminderMinute,
    flashcardsDue,
    revisionPlanEnabled,
    weakQuizEnabled,
  );
}
