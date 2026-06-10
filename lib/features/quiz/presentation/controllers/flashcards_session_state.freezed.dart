// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcards_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlashcardsSessionState {

 bool get isLoading; LearningSession? get session; String? get errorCode; int get currentIndex; bool get isFlipped;
/// Create a copy of FlashcardsSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardsSessionStateCopyWith<FlashcardsSessionState> get copyWith => _$FlashcardsSessionStateCopyWithImpl<FlashcardsSessionState>(this as FlashcardsSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardsSessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.isFlipped, isFlipped) || other.isFlipped == isFlipped));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,errorCode,currentIndex,isFlipped);

@override
String toString() {
  return 'FlashcardsSessionState(isLoading: $isLoading, session: $session, errorCode: $errorCode, currentIndex: $currentIndex, isFlipped: $isFlipped)';
}


}

/// @nodoc
abstract mixin class $FlashcardsSessionStateCopyWith<$Res>  {
  factory $FlashcardsSessionStateCopyWith(FlashcardsSessionState value, $Res Function(FlashcardsSessionState) _then) = _$FlashcardsSessionStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, LearningSession? session, String? errorCode, int currentIndex, bool isFlipped
});




}
/// @nodoc
class _$FlashcardsSessionStateCopyWithImpl<$Res>
    implements $FlashcardsSessionStateCopyWith<$Res> {
  _$FlashcardsSessionStateCopyWithImpl(this._self, this._then);

  final FlashcardsSessionState _self;
  final $Res Function(FlashcardsSessionState) _then;

/// Create a copy of FlashcardsSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? session = freezed,Object? errorCode = freezed,Object? currentIndex = null,Object? isFlipped = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LearningSession?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,isFlipped: null == isFlipped ? _self.isFlipped : isFlipped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashcardsSessionState].
extension FlashcardsSessionStatePatterns on FlashcardsSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashcardsSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashcardsSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashcardsSessionState value)  $default,){
final _that = this;
switch (_that) {
case _FlashcardsSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashcardsSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _FlashcardsSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  LearningSession? session,  String? errorCode,  int currentIndex,  bool isFlipped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardsSessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.errorCode,_that.currentIndex,_that.isFlipped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  LearningSession? session,  String? errorCode,  int currentIndex,  bool isFlipped)  $default,) {final _that = this;
switch (_that) {
case _FlashcardsSessionState():
return $default(_that.isLoading,_that.session,_that.errorCode,_that.currentIndex,_that.isFlipped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  LearningSession? session,  String? errorCode,  int currentIndex,  bool isFlipped)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardsSessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.errorCode,_that.currentIndex,_that.isFlipped);case _:
  return null;

}
}

}

/// @nodoc


class _FlashcardsSessionState extends FlashcardsSessionState {
  const _FlashcardsSessionState({this.isLoading = false, this.session, this.errorCode, this.currentIndex = 0, this.isFlipped = false}): super._();
  

@override@JsonKey() final  bool isLoading;
@override final  LearningSession? session;
@override final  String? errorCode;
@override@JsonKey() final  int currentIndex;
@override@JsonKey() final  bool isFlipped;

/// Create a copy of FlashcardsSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardsSessionStateCopyWith<_FlashcardsSessionState> get copyWith => __$FlashcardsSessionStateCopyWithImpl<_FlashcardsSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardsSessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&(identical(other.isFlipped, isFlipped) || other.isFlipped == isFlipped));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,errorCode,currentIndex,isFlipped);

@override
String toString() {
  return 'FlashcardsSessionState(isLoading: $isLoading, session: $session, errorCode: $errorCode, currentIndex: $currentIndex, isFlipped: $isFlipped)';
}


}

/// @nodoc
abstract mixin class _$FlashcardsSessionStateCopyWith<$Res> implements $FlashcardsSessionStateCopyWith<$Res> {
  factory _$FlashcardsSessionStateCopyWith(_FlashcardsSessionState value, $Res Function(_FlashcardsSessionState) _then) = __$FlashcardsSessionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, LearningSession? session, String? errorCode, int currentIndex, bool isFlipped
});




}
/// @nodoc
class __$FlashcardsSessionStateCopyWithImpl<$Res>
    implements _$FlashcardsSessionStateCopyWith<$Res> {
  __$FlashcardsSessionStateCopyWithImpl(this._self, this._then);

  final _FlashcardsSessionState _self;
  final $Res Function(_FlashcardsSessionState) _then;

/// Create a copy of FlashcardsSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? session = freezed,Object? errorCode = freezed,Object? currentIndex = null,Object? isFlipped = null,}) {
  return _then(_FlashcardsSessionState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LearningSession?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,isFlipped: null == isFlipped ? _self.isFlipped : isFlipped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
