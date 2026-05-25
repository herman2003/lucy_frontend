// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validate_answer_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ValidateAnswerResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidateAnswerResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ValidateAnswerResult()';
}


}

/// @nodoc
class $ValidateAnswerResultCopyWith<$Res>  {
$ValidateAnswerResultCopyWith(ValidateAnswerResult _, $Res Function(ValidateAnswerResult) __);
}


/// Adds pattern-matching-related methods to [ValidateAnswerResult].
extension ValidateAnswerResultPatterns on ValidateAnswerResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ValidateAnswerAccepted value)?  accepted,TResult Function( ValidateAnswerNeedsRetry value)?  needsRetry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ValidateAnswerAccepted() when accepted != null:
return accepted(_that);case ValidateAnswerNeedsRetry() when needsRetry != null:
return needsRetry(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ValidateAnswerAccepted value)  accepted,required TResult Function( ValidateAnswerNeedsRetry value)  needsRetry,}){
final _that = this;
switch (_that) {
case ValidateAnswerAccepted():
return accepted(_that);case ValidateAnswerNeedsRetry():
return needsRetry(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ValidateAnswerAccepted value)?  accepted,TResult? Function( ValidateAnswerNeedsRetry value)?  needsRetry,}){
final _that = this;
switch (_that) {
case ValidateAnswerAccepted() when accepted != null:
return accepted(_that);case ValidateAnswerNeedsRetry() when needsRetry != null:
return needsRetry(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String turnSummary)?  accepted,TResult Function( String rephrasedQuestion,  String reason)?  needsRetry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ValidateAnswerAccepted() when accepted != null:
return accepted(_that.turnSummary);case ValidateAnswerNeedsRetry() when needsRetry != null:
return needsRetry(_that.rephrasedQuestion,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String turnSummary)  accepted,required TResult Function( String rephrasedQuestion,  String reason)  needsRetry,}) {final _that = this;
switch (_that) {
case ValidateAnswerAccepted():
return accepted(_that.turnSummary);case ValidateAnswerNeedsRetry():
return needsRetry(_that.rephrasedQuestion,_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String turnSummary)?  accepted,TResult? Function( String rephrasedQuestion,  String reason)?  needsRetry,}) {final _that = this;
switch (_that) {
case ValidateAnswerAccepted() when accepted != null:
return accepted(_that.turnSummary);case ValidateAnswerNeedsRetry() when needsRetry != null:
return needsRetry(_that.rephrasedQuestion,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class ValidateAnswerAccepted implements ValidateAnswerResult {
  const ValidateAnswerAccepted({required this.turnSummary});
  

 final  String turnSummary;

/// Create a copy of ValidateAnswerResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidateAnswerAcceptedCopyWith<ValidateAnswerAccepted> get copyWith => _$ValidateAnswerAcceptedCopyWithImpl<ValidateAnswerAccepted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidateAnswerAccepted&&(identical(other.turnSummary, turnSummary) || other.turnSummary == turnSummary));
}


@override
int get hashCode => Object.hash(runtimeType,turnSummary);

@override
String toString() {
  return 'ValidateAnswerResult.accepted(turnSummary: $turnSummary)';
}


}

/// @nodoc
abstract mixin class $ValidateAnswerAcceptedCopyWith<$Res> implements $ValidateAnswerResultCopyWith<$Res> {
  factory $ValidateAnswerAcceptedCopyWith(ValidateAnswerAccepted value, $Res Function(ValidateAnswerAccepted) _then) = _$ValidateAnswerAcceptedCopyWithImpl;
@useResult
$Res call({
 String turnSummary
});




}
/// @nodoc
class _$ValidateAnswerAcceptedCopyWithImpl<$Res>
    implements $ValidateAnswerAcceptedCopyWith<$Res> {
  _$ValidateAnswerAcceptedCopyWithImpl(this._self, this._then);

  final ValidateAnswerAccepted _self;
  final $Res Function(ValidateAnswerAccepted) _then;

/// Create a copy of ValidateAnswerResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? turnSummary = null,}) {
  return _then(ValidateAnswerAccepted(
turnSummary: null == turnSummary ? _self.turnSummary : turnSummary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ValidateAnswerNeedsRetry implements ValidateAnswerResult {
  const ValidateAnswerNeedsRetry({required this.rephrasedQuestion, required this.reason});
  

 final  String rephrasedQuestion;
 final  String reason;

/// Create a copy of ValidateAnswerResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidateAnswerNeedsRetryCopyWith<ValidateAnswerNeedsRetry> get copyWith => _$ValidateAnswerNeedsRetryCopyWithImpl<ValidateAnswerNeedsRetry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidateAnswerNeedsRetry&&(identical(other.rephrasedQuestion, rephrasedQuestion) || other.rephrasedQuestion == rephrasedQuestion)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,rephrasedQuestion,reason);

@override
String toString() {
  return 'ValidateAnswerResult.needsRetry(rephrasedQuestion: $rephrasedQuestion, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $ValidateAnswerNeedsRetryCopyWith<$Res> implements $ValidateAnswerResultCopyWith<$Res> {
  factory $ValidateAnswerNeedsRetryCopyWith(ValidateAnswerNeedsRetry value, $Res Function(ValidateAnswerNeedsRetry) _then) = _$ValidateAnswerNeedsRetryCopyWithImpl;
@useResult
$Res call({
 String rephrasedQuestion, String reason
});




}
/// @nodoc
class _$ValidateAnswerNeedsRetryCopyWithImpl<$Res>
    implements $ValidateAnswerNeedsRetryCopyWith<$Res> {
  _$ValidateAnswerNeedsRetryCopyWithImpl(this._self, this._then);

  final ValidateAnswerNeedsRetry _self;
  final $Res Function(ValidateAnswerNeedsRetry) _then;

/// Create a copy of ValidateAnswerResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rephrasedQuestion = null,Object? reason = null,}) {
  return _then(ValidateAnswerNeedsRetry(
rephrasedQuestion: null == rephrasedQuestion ? _self.rephrasedQuestion : rephrasedQuestion // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
