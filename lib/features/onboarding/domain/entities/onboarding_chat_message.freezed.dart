// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingChatMessage {

 bool get isFromLucy; String get text;
/// Create a copy of OnboardingChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingChatMessageCopyWith<OnboardingChatMessage> get copyWith => _$OnboardingChatMessageCopyWithImpl<OnboardingChatMessage>(this as OnboardingChatMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingChatMessage&&(identical(other.isFromLucy, isFromLucy) || other.isFromLucy == isFromLucy)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,isFromLucy,text);

@override
String toString() {
  return 'OnboardingChatMessage(isFromLucy: $isFromLucy, text: $text)';
}


}

/// @nodoc
abstract mixin class $OnboardingChatMessageCopyWith<$Res>  {
  factory $OnboardingChatMessageCopyWith(OnboardingChatMessage value, $Res Function(OnboardingChatMessage) _then) = _$OnboardingChatMessageCopyWithImpl;
@useResult
$Res call({
 bool isFromLucy, String text
});




}
/// @nodoc
class _$OnboardingChatMessageCopyWithImpl<$Res>
    implements $OnboardingChatMessageCopyWith<$Res> {
  _$OnboardingChatMessageCopyWithImpl(this._self, this._then);

  final OnboardingChatMessage _self;
  final $Res Function(OnboardingChatMessage) _then;

/// Create a copy of OnboardingChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFromLucy = null,Object? text = null,}) {
  return _then(_self.copyWith(
isFromLucy: null == isFromLucy ? _self.isFromLucy : isFromLucy // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingChatMessage].
extension OnboardingChatMessagePatterns on OnboardingChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isFromLucy,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingChatMessage() when $default != null:
return $default(_that.isFromLucy,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isFromLucy,  String text)  $default,) {final _that = this;
switch (_that) {
case _OnboardingChatMessage():
return $default(_that.isFromLucy,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isFromLucy,  String text)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingChatMessage() when $default != null:
return $default(_that.isFromLucy,_that.text);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingChatMessage implements OnboardingChatMessage {
  const _OnboardingChatMessage({required this.isFromLucy, required this.text});
  

@override final  bool isFromLucy;
@override final  String text;

/// Create a copy of OnboardingChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingChatMessageCopyWith<_OnboardingChatMessage> get copyWith => __$OnboardingChatMessageCopyWithImpl<_OnboardingChatMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingChatMessage&&(identical(other.isFromLucy, isFromLucy) || other.isFromLucy == isFromLucy)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,isFromLucy,text);

@override
String toString() {
  return 'OnboardingChatMessage(isFromLucy: $isFromLucy, text: $text)';
}


}

/// @nodoc
abstract mixin class _$OnboardingChatMessageCopyWith<$Res> implements $OnboardingChatMessageCopyWith<$Res> {
  factory _$OnboardingChatMessageCopyWith(_OnboardingChatMessage value, $Res Function(_OnboardingChatMessage) _then) = __$OnboardingChatMessageCopyWithImpl;
@override @useResult
$Res call({
 bool isFromLucy, String text
});




}
/// @nodoc
class __$OnboardingChatMessageCopyWithImpl<$Res>
    implements _$OnboardingChatMessageCopyWith<$Res> {
  __$OnboardingChatMessageCopyWithImpl(this._self, this._then);

  final _OnboardingChatMessage _self;
  final $Res Function(_OnboardingChatMessage) _then;

/// Create a copy of OnboardingChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFromLucy = null,Object? text = null,}) {
  return _then(_OnboardingChatMessage(
isFromLucy: null == isFromLucy ? _self.isFromLucy : isFromLucy // ignore: cast_nullable_to_non_nullable
as bool,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
