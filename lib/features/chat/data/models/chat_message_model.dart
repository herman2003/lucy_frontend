import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_source_model.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    required String id,
    required String role,
    required String content,
    required String createdAt,
    String? status,
    List<ChatSourceModel>? sources,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
