/// Raw SSE block before JSON mapping.
class ChatSseRawEvent {
  const ChatSseRawEvent({required this.event, required this.data});

  final String event;
  final String data;
}

/// Incremental parser for `text/event-stream` blocks (event + data lines).
class ChatSseParser {
  String _buffer = '';

  List<ChatSseRawEvent> feed(String chunk) {
    _buffer += chunk;
    final events = <ChatSseRawEvent>[];

    while (true) {
      final separator = _buffer.indexOf('\n\n');
      if (separator < 0) {
        break;
      }

      final block = _buffer.substring(0, separator);
      _buffer = _buffer.substring(separator + 2);
      final parsed = _parseBlock(block);
      if (parsed != null) {
        events.add(parsed);
      }
    }

    return events;
  }

  ChatSseRawEvent? _parseBlock(String block) {
    var eventName = '';
    final dataLines = <String>[];

    for (final line in block.split('\n')) {
      if (line.startsWith(':')) {
        continue;
      }
      if (line.startsWith('event:')) {
        eventName = line.substring('event:'.length).trim();
      } else if (line.startsWith('data:')) {
        dataLines.add(line.substring('data:'.length).trim());
      }
    }

    if (eventName.isEmpty) {
      return null;
    }

    return ChatSseRawEvent(event: eventName, data: dataLines.join('\n'));
  }
}

/// Aggregates streamed text deltas (used by notifier and tests).
String aggregateChatStreamDeltas(Iterable<String> deltas) => deltas.join();
