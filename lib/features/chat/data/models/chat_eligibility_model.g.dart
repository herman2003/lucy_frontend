// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_eligibility_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatEligibilityModel _$ChatEligibilityModelFromJson(
  Map<String, dynamic> json,
) => _ChatEligibilityModel(
  canChat: json['canChat'] as bool,
  activeDocumentCount: (json['activeDocumentCount'] as num).toInt(),
);

Map<String, dynamic> _$ChatEligibilityModelToJson(
  _ChatEligibilityModel instance,
) => <String, dynamic>{
  'canChat': instance.canChat,
  'activeDocumentCount': instance.activeDocumentCount,
};
