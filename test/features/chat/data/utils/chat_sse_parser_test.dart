import 'package:flutter_test/flutter_test.dart';
import 'package:lucy_frontend/features/chat/data/utils/chat_sse_parser.dart';

void main() {
  group('ChatSseParser', () {
    test('parses event blocks split across chunks', () {
      final parser = ChatSseParser();
      final first = parser.feed('event: text_delta\ndata: {"delta":"Hel"}\n\n');
      expect(first, hasLength(1));
      expect(first.single.event, 'text_delta');

      final second = parser.feed('event: text_delta\ndata: {"delta":"lo"}\n\n');
      expect(second, hasLength(1));
      expect(second.single.data, contains('"delta":"lo"'));
    });
  });

  group('aggregateChatStreamDeltas', () {
    test('joins deltas into final assistant text', () {
      expect(
        aggregateChatStreamDeltas(['Bon', 'jour', ' ', 'Lucy']),
        'Bonjour Lucy',
      );
    });
  });
}
