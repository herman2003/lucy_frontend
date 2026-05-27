/// Citation embedded on an assistant message (spec §3.3).
class ChatSource {
  const ChatSource({
    required this.documentId,
    required this.title,
    required this.chunkId,
    required this.excerpt,
    this.pageStart,
    this.pageEnd,
    this.score,
  });

  final String documentId;
  final String title;
  final String chunkId;
  final String excerpt;
  final int? pageStart;
  final int? pageEnd;
  final double? score;
}
