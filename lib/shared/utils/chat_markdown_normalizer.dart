/// Normalizes assistant markdown so lists and blocks render with visible breaks.
String normalizeChatMarkdown(String text) {
  if (text.isEmpty) {
    return text;
  }

  final lines = text.replaceAll(RegExp(r'^[\t ]*•\s?', multiLine: true), '- ').split('\n');
  final output = <String>[];
  String? previousNonEmpty;

  for (final line in lines) {
    if (line.trim().isEmpty) {
      if (output.isNotEmpty && output.last.isNotEmpty) {
        output.add('');
      }
      previousNonEmpty = null;
      continue;
    }

    final isBlock = _isMarkdownBlockLine(line);
    if (previousNonEmpty != null) {
      final previousIsBlock = _isMarkdownBlockLine(previousNonEmpty);
      final needsGap =
          (isBlock && !previousIsBlock) ||
          (isBlock && previousIsBlock) ||
          (!isBlock && previousIsBlock);
      if (needsGap && output.isNotEmpty && output.last.isNotEmpty) {
        output.add('');
      }
    }

    output.add(line);
    previousNonEmpty = line;
  }

  return output.join('\n');
}

bool _isMarkdownBlockLine(String line) {
  final trimmed = line.trimLeft();
  return RegExp(r'^(-|\*|\+|\d+\.)\s').hasMatch(trimmed) ||
      RegExp(r'^\*\*J-\d+\*\*').hasMatch(trimmed);
}
