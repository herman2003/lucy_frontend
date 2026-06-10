enum ChatMessageStatus {
  completed,
  failed;

  static ChatMessageStatus? fromApi(String? value) => switch (value) {
    'completed' => ChatMessageStatus.completed,
    'failed' => ChatMessageStatus.failed,
    _ => null,
  };

  String toApi() => name;
}
