enum ChatMessageRole {
  user,
  assistant;

  static ChatMessageRole fromApi(String value) => switch (value) {
    'user' => ChatMessageRole.user,
    'assistant' => ChatMessageRole.assistant,
    _ => ChatMessageRole.user,
  };

  String toApi() => name;
}
