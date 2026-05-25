// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_turn_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConfirmTurnResult {

 String get onboardingStatus; int get completedTurns;
/// Create a copy of ConfirmTurnResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmTurnResultCopyWith<ConfirmTurnResult> get copyWith => _$ConfirmTurnResultCopyWithImpl<ConfirmTurnResult>(this as ConfirmTurnResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmTurnResult&&(identical(other.onboardingStatus, onboardingStatus) || other.onboardingStatus == onboardingStatus)&&(identical(other.completedTurns, completedTurns) || other.completedTurns == completedTurns));
}


@override
int get hashCode => Object.hash(runtimeType,onboardingStatus,completedTurns);

@override
String toString() {
  return 'ConfirmTurnResult(onboardingStatus: $onboardingStatus, completedTurns: $completedTurns)';
}


}

/// @nodoc
abstract mixin class $ConfirmTurnResultCopyWith<$Res>  {
  factory $ConfirmTurnResultCopyWith(ConfirmTurnResult value, $Res Function(ConfirmTurnResult) _then) = _$ConfirmTurnResultCopyWithImpl;
@useResult
$Res call({
 String onboardingStatus, int completedTurns
});




}
/// @nodoc
class _$ConfirmTurnResultCopyWithImpl<$Res>
    implements $ConfirmTurnResultCopyWith<$Res> {
  _$ConfirmTurnResultCopyWithImpl(this._self, this._then);

  final ConfirmTurnResult _self;
  final $Res Function(ConfirmTurnResult) _then;

/// Create a copy of ConfirmTurnResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? onboardingStatus = null,Object? completedTurns = null,}) {
  return _then(_self.copyWith(
onboardingStatus: null == onboardingStatus ? _self.onboardingStatus : onboardingStatus // ignore: cast_nullable_to_non_nullable
as String,completedTurns: null == completedTurns ? _self.completedTurns : completedTurns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmTurnResult].
extension ConfirmTurnResultPatterns on ConfirmTurnResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmTurnResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmTurnResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmTurnResult value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmTurnResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmTurnResult value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmTurnResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String onboardingStatus,  int completedTurns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmTurnResult() when $default != null:
return $default(_that.onboardingStatus,_that.completedTurns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String onboardingStatus,  int completedTurns)  $default,) {final _that = this;
switch (_that) {
case _ConfirmTurnResult():
return $default(_that.onboardingStatus,_that.completedTurns);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String onboardingStatus,  int completedTurns)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmTurnResult() when $default != null:
return $default(_that.onboardingStatus,_that.completedTurns);case _:
  return null;

}
}

}

/// @nodoc


class _ConfirmTurnResult implements ConfirmTurnResult {
  const _ConfirmTurnResult({required this.onboardingStatus, required this.completedTurns});
  

@override final  String onboardingStatus;
@override final  int completedTurns;

/// Create a copy of ConfirmTurnResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmTurnResultCopyWith<_ConfirmTurnResult> get copyWith => __$ConfirmTurnResultCopyWithImpl<_ConfirmTurnResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmTurnResult&&(identical(other.onboardingStatus, onboardingStatus) || other.onboardingStatus == onboardingStatus)&&(identical(other.completedTurns, completedTurns) || other.completedTurns == completedTurns));
}


@override
int get hashCode => Object.hash(runtimeType,onboardingStatus,completedTurns);

@override
String toString() {
  return 'ConfirmTurnResult(onboardingStatus: $onboardingStatus, completedTurns: $completedTurns)';
}


}

/// @nodoc
abstract mixin class _$ConfirmTurnResultCopyWith<$Res> implements $ConfirmTurnResultCopyWith<$Res> {
  factory _$ConfirmTurnResultCopyWith(_ConfirmTurnResult value, $Res Function(_ConfirmTurnResult) _then) = __$ConfirmTurnResultCopyWithImpl;
@override @useResult
$Res call({
 String onboardingStatus, int completedTurns
});




}
/// @nodoc
class __$ConfirmTurnResultCopyWithImpl<$Res>
    implements _$ConfirmTurnResultCopyWith<$Res> {
  __$ConfirmTurnResultCopyWithImpl(this._self, this._then);

  final _ConfirmTurnResult _self;
  final $Res Function(_ConfirmTurnResult) _then;

/// Create a copy of ConfirmTurnResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? onboardingStatus = null,Object? completedTurns = null,}) {
  return _then(_ConfirmTurnResult(
onboardingStatus: null == onboardingStatus ? _self.onboardingStatus : onboardingStatus // ignore: cast_nullable_to_non_nullable
as String,completedTurns: null == completedTurns ? _self.completedTurns : completedTurns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
