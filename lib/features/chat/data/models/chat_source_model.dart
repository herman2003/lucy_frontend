import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_source_model.freezed.dart';
part 'chat_source_model.g.dart';

@freezed
abstract class ChatSourceModel with _$ChatSourceModel {
  const factory ChatSourceModel({
    required String documentId,
    required String title,
    required String chunkId,
    required String excerpt,
    int? pageStart,
    int? pageEnd,
    double? score,
  }) = _ChatSourceModel;

  factory ChatSourceModel.fromJson(Map<String, dynamic> json) =>
      _$ChatSourceModelFromJson(json);
}
