// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_eligibility_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatEligibilityModel {

 bool get canChat; int get activeDocumentCount;
/// Create a copy of ChatEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatEligibilityModelCopyWith<ChatEligibilityModel> get copyWith => _$ChatEligibilityModelCopyWithImpl<ChatEligibilityModel>(this as ChatEligibilityModel, _$identity);

  /// Serializes this ChatEligibilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEligibilityModel&&(identical(other.canChat, canChat) || other.canChat == canChat)&&(identical(other.activeDocumentCount, activeDocumentCount) || other.activeDocumentCount == activeDocumentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canChat,activeDocumentCount);

@override
String toString() {
  return 'ChatEligibilityModel(canChat: $canChat, activeDocumentCount: $activeDocumentCount)';
}


}

/// @nodoc
abstract mixin class $ChatEligibilityModelCopyWith<$Res>  {
  factory $ChatEligibilityModelCopyWith(ChatEligibilityModel value, $Res Function(ChatEligibilityModel) _then) = _$ChatEligibilityModelCopyWithImpl;
@useResult
$Res call({
 bool canChat, int activeDocumentCount
});




}
/// @nodoc
class _$ChatEligibilityModelCopyWithImpl<$Res>
    implements $ChatEligibilityModelCopyWith<$Res> {
  _$ChatEligibilityModelCopyWithImpl(this._self, this._then);

  final ChatEligibilityModel _self;
  final $Res Function(ChatEligibilityModel) _then;

/// Create a copy of ChatEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canChat = null,Object? activeDocumentCount = null,}) {
  return _then(_self.copyWith(
canChat: null == canChat ? _self.canChat : canChat // ignore: cast_nullable_to_non_nullable
as bool,activeDocumentCount: null == activeDocumentCount ? _self.activeDocumentCount : activeDocumentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatEligibilityModel].
extension ChatEligibilityModelPatterns on ChatEligibilityModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatEligibilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatEligibilityModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatEligibilityModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatEligibilityModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatEligibilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatEligibilityModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canChat,  int activeDocumentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatEligibilityModel() when $default != null:
return $default(_that.canChat,_that.activeDocumentCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canChat,  int activeDocumentCount)  $default,) {final _that = this;
switch (_that) {
case _ChatEligibilityModel():
return $default(_that.canChat,_that.activeDocumentCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canChat,  int activeDocumentCount)?  $default,) {final _that = this;
switch (_that) {
case _ChatEligibilityModel() when $default != null:
return $default(_that.canChat,_that.activeDocumentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatEligibilityModel implements ChatEligibilityModel {
  const _ChatEligibilityModel({required this.canChat, required this.activeDocumentCount});
  factory _ChatEligibilityModel.fromJson(Map<String, dynamic> json) => _$ChatEligibilityModelFromJson(json);

@override final  bool canChat;
@override final  int activeDocumentCount;

/// Create a copy of ChatEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatEligibilityModelCopyWith<_ChatEligibilityModel> get copyWith => __$ChatEligibilityModelCopyWithImpl<_ChatEligibilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatEligibilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatEligibilityModel&&(identical(other.canChat, canChat) || other.canChat == canChat)&&(identical(other.activeDocumentCount, activeDocumentCount) || other.activeDocumentCount == activeDocumentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canChat,activeDocumentCount);

@override
String toString() {
  return 'ChatEligibilityModel(canChat: $canChat, activeDocumentCount: $activeDocumentCount)';
}


}

/// @nodoc
abstract mixin class _$ChatEligibilityModelCopyWith<$Res> implements $ChatEligibilityModelCopyWith<$Res> {
  factory _$ChatEligibilityModelCopyWith(_ChatEligibilityModel value, $Res Function(_ChatEligibilityModel) _then) = __$ChatEligibilityModelCopyWithImpl;
@override @useResult
$Res call({
 bool canChat, int activeDocumentCount
});




}
/// @nodoc
class __$ChatEligibilityModelCopyWithImpl<$Res>
    implements _$ChatEligibilityModelCopyWith<$Res> {
  __$ChatEligibilityModelCopyWithImpl(this._self, this._then);

  final _ChatEligibilityModel _self;
  final $Res Function(_ChatEligibilityModel) _then;

/// Create a copy of ChatEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canChat = null,Object? activeDocumentCount = null,}) {
  return _then(_ChatEligibilityModel(
canChat: null == canChat ? _self.canChat : canChat // ignore: cast_nullable_to_non_nullable
as bool,activeDocumentCount: null == activeDocumentCount ? _self.activeDocumentCount : activeDocumentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
