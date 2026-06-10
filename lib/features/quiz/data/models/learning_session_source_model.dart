import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_session_source_model.freezed.dart';
part 'learning_session_source_model.g.dart';

@freezed
abstract class LearningSessionSourceModel with _$LearningSessionSourceModel {
  const factory LearningSessionSourceModel({
    required String chunkId,
    required String documentId,
    required String title,
    required String excerpt,
    int? pageStart,
    int? pageEnd,
  }) = _LearningSessionSourceModel;

  factory LearningSessionSourceModel.fromJson(Map<String, dynamic> json) =>
      _$LearningSessionSourceModelFromJson(json);
}
