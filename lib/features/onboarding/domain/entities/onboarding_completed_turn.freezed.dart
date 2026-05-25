// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_completed_turn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingCompletedTurn {

 String get questionId; String get questionText; String get answerText; String get turnSummary;
/// Create a copy of OnboardingCompletedTurn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingCompletedTurnCopyWith<OnboardingCompletedTurn> get copyWith => _$OnboardingCompletedTurnCopyWithImpl<OnboardingCompletedTurn>(this as OnboardingCompletedTurn, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingCompletedTurn&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.answerText, answerText) || other.answerText == answerText)&&(identical(other.turnSummary, turnSummary) || other.turnSummary == turnSummary));
}


@override
int get hashCode => Object.hash(runtimeType,questionId,questionText,answerText,turnSummary);

@override
String toString() {
  return 'OnboardingCompletedTurn(questionId: $questionId, questionText: $questionText, answerText: $answerText, turnSummary: $turnSummary)';
}


}

/// @nodoc
abstract mixin class $OnboardingCompletedTurnCopyWith<$Res>  {
  factory $OnboardingCompletedTurnCopyWith(OnboardingCompletedTurn value, $Res Function(OnboardingCompletedTurn) _then) = _$OnboardingCompletedTurnCopyWithImpl;
@useResult
$Res call({
 String questionId, String questionText, String answerText, String turnSummary
});




}
/// @nodoc
class _$OnboardingCompletedTurnCopyWithImpl<$Res>
    implements $OnboardingCompletedTurnCopyWith<$Res> {
  _$OnboardingCompletedTurnCopyWithImpl(this._self, this._then);

  final OnboardingCompletedTurn _self;
  final $Res Function(OnboardingCompletedTurn) _then;

/// Create a copy of OnboardingCompletedTurn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? questionText = null,Object? answerText = null,Object? turnSummary = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,answerText: null == answerText ? _self.answerText : answerText // ignore: cast_nullable_to_non_nullable
as String,turnSummary: null == turnSummary ? _self.turnSummary : turnSummary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingCompletedTurn].
extension OnboardingCompletedTurnPatterns on OnboardingCompletedTurn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingCompletedTurn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingCompletedTurn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingCompletedTurn value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingCompletedTurn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingCompletedTurn value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingCompletedTurn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String questionId,  String questionText,  String answerText,  String turnSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingCompletedTurn() when $default != null:
return $default(_that.questionId,_that.questionText,_that.answerText,_that.turnSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String questionId,  String questionText,  String answerText,  String turnSummary)  $default,) {final _that = this;
switch (_that) {
case _OnboardingCompletedTurn():
return $default(_that.questionId,_that.questionText,_that.answerText,_that.turnSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String questionId,  String questionText,  String answerText,  String turnSummary)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingCompletedTurn() when $default != null:
return $default(_that.questionId,_that.questionText,_that.answerText,_that.turnSummary);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingCompletedTurn implements OnboardingCompletedTurn {
  const _OnboardingCompletedTurn({required this.questionId, required this.questionText, required this.answerText, required this.turnSummary});
  

@override final  String questionId;
@override final  String questionText;
@override final  String answerText;
@override final  String turnSummary;

/// Create a copy of OnboardingCompletedTurn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingCompletedTurnCopyWith<_OnboardingCompletedTurn> get copyWith => __$OnboardingCompletedTurnCopyWithImpl<_OnboardingCompletedTurn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingCompletedTurn&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.answerText, answerText) || other.answerText == answerText)&&(identical(other.turnSummary, turnSummary) || other.turnSummary == turnSummary));
}


@override
int get hashCode => Object.hash(runtimeType,questionId,questionText,answerText,turnSummary);

@override
String toString() {
  return 'OnboardingCompletedTurn(questionId: $questionId, questionText: $questionText, answerText: $answerText, turnSummary: $turnSummary)';
}


}

/// @nodoc
abstract mixin class _$OnboardingCompletedTurnCopyWith<$Res> implements $OnboardingCompletedTurnCopyWith<$Res> {
  factory _$OnboardingCompletedTurnCopyWith(_OnboardingCompletedTurn value, $Res Function(_OnboardingCompletedTurn) _then) = __$OnboardingCompletedTurnCopyWithImpl;
@override @useResult
$Res call({
 String questionId, String questionText, String answerText, String turnSummary
});




}
/// @nodoc
class __$OnboardingCompletedTurnCopyWithImpl<$Res>
    implements _$OnboardingCompletedTurnCopyWith<$Res> {
  __$OnboardingCompletedTurnCopyWithImpl(this._self, this._then);

  final _OnboardingCompletedTurn _self;
  final $Res Function(_OnboardingCompletedTurn) _then;

/// Create a copy of OnboardingCompletedTurn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? questionText = null,Object? answerText = null,Object? turnSummary = null,}) {
  return _then(_OnboardingCompletedTurn(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,answerText: null == answerText ? _self.answerText : answerText // ignore: cast_nullable_to_non_nullable
as String,turnSummary: null == turnSummary ? _self.turnSummary : turnSummary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
