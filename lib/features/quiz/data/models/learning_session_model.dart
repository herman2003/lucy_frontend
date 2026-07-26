import 'package:freezed_annotation/freezed_annotation.dart';

import 'learning_session_item_model.dart';

part 'learning_session_model.freezed.dart';
part 'learning_session_model.g.dart';

@freezed
abstract class LearningSessionModel with _$LearningSessionModel {
  const factory LearningSessionModel({
    required String id,
    required String type,
    required String status,
    required int itemCount,
    required String title,
    required String createdAt,
    required String updatedAt,
    required int activeDocumentCount,
    String? sourceChatId,
    @Default(<LearningSessionItemModel>[]) List<LearningSessionItemModel> items,
  }) = _LearningSessionModel;

  factory LearningSessionModel.fromJson(Map<String, dynamic> json) =>
      _$LearningSessionModelFromJson(json);
}
