class LearningSessionSource {
  const LearningSessionSource({
    required this.chunkId,
    required this.documentId,
    required this.title,
    required this.excerpt,
    this.pageStart,
    this.pageEnd,
  });

  final String chunkId;
  final String documentId;
  final String title;
  final String excerpt;
  final int? pageStart;
  final int? pageEnd;
}
