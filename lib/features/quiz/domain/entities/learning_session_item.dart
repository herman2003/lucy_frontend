import 'learning_session_source.dart';

class LearningSessionItem {
  const LearningSessionItem({
    required this.id,
    required this.sources,
    this.question,
    this.choices,
    this.correctIndex,
    this.explanation,
    this.front,
    this.back,
  });

  final String id;
  final List<LearningSessionSource> sources;
  final String? question;
  final List<String>? choices;
  final int? correctIndex;
  final String? explanation;
  final String? front;
  final String? back;
}
