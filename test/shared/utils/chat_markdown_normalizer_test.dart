import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/shared/utils/chat_markdown_normalizer.dart';

void main() {
  group('normalizeChatMarkdown', () {
    test('inserts blank lines between unordered list items', () {
      const input = '- first item\n- second item\n- third item';
      final output = normalizeChatMarkdown(input);

      expect(output, '- first item\n\n- second item\n\n- third item');
    });

    test('inserts blank line before a list after a paragraph', () {
      const input = 'Introduction:\n- step one\n- step two';
      final output = normalizeChatMarkdown(input);

      expect(output, contains('Introduction:\n\n- step one'));
    });

    test('converts bullet character to markdown dash', () {
      const input = '• first\n• second';
      final output = normalizeChatMarkdown(input);

      expect(output, contains('- first'));
      expect(output, contains('- second'));
    });

    test('inserts blank lines between numbered items from LLM output', () {
      const input = '1. Alpha\n2. Beta';
      final output = normalizeChatMarkdown(input);

      expect(output, '1. Alpha\n\n2. Beta');
    });
  });
}
