import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_thread_model.freezed.dart';
part 'chat_thread_model.g.dart';

@freezed
abstract class ChatThreadModel with _$ChatThreadModel {
  const factory ChatThreadModel({
    required String id,
    required String title,
    required String updatedAt,
    String? createdAt,
    String? lastMessagePreview,
  }) = _ChatThreadModel;

  factory ChatThreadModel.fromJson(Map<String, dynamic> json) =>
      _$ChatThreadModelFromJson(json);
}
