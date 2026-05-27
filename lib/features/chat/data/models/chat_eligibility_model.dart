import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_eligibility_model.freezed.dart';
part 'chat_eligibility_model.g.dart';

@freezed
abstract class ChatEligibilityModel with _$ChatEligibilityModel {
  const factory ChatEligibilityModel({
    required bool canChat,
    required int activeDocumentCount,
  }) = _ChatEligibilityModel;

  factory ChatEligibilityModel.fromJson(Map<String, dynamic> json) =>
      _$ChatEligibilityModelFromJson(json);
}
