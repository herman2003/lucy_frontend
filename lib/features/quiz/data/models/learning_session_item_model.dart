import 'package:freezed_annotation/freezed_annotation.dart';

import 'learning_session_source_model.dart';

part 'learning_session_item_model.freezed.dart';
part 'learning_session_item_model.g.dart';

@freezed
abstract class LearningSessionItemModel with _$LearningSessionItemModel {
  const factory LearningSessionItemModel({
    required String id,
    @Default(<LearningSessionSourceModel>[]) List<LearningSessionSourceModel> sources,
    String? question,
    List<String>? choices,
    int? correctIndex,
    String? explanation,
    String? front,
    String? back,
  }) = _LearningSessionItemModel;

  factory LearningSessionItemModel.fromJson(Map<String, dynamic> json) =>
      _$LearningSessionItemModelFromJson(json);
}
