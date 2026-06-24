import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_session_list_item_model.freezed.dart';
part 'learning_session_list_item_model.g.dart';

@freezed
abstract class LearningSessionListItemModel
    with _$LearningSessionListItemModel {
  const factory LearningSessionListItemModel({
    required String id,
    required String type,
    required String status,
    required int itemCount,
    required String title,
    required String createdAt,
    required String updatedAt,
  }) = _LearningSessionListItemModel;

  factory LearningSessionListItemModel.fromJson(Map<String, dynamic> json) =>
      _$LearningSessionListItemModelFromJson(json);
}
