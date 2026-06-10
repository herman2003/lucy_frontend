// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizSessionState {

 bool get isLoading; LearningSession? get session; String? get errorCode; int get currentIndex; Map<String, int> get selectedAnswers; bool get isComplete;
/// Create a copy of QuizSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizSessionStateCopyWith<QuizSessionState> get copyWith => _$QuizSessionStateCopyWithImpl<QuizSessionState>(this as QuizSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizSessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other.selectedAnswers, selectedAnswers)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,errorCode,currentIndex,const DeepCollectionEquality().hash(selectedAnswers),isComplete);

@override
String toString() {
  return 'QuizSessionState(isLoading: $isLoading, session: $session, errorCode: $errorCode, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers, isComplete: $isComplete)';
}


}

/// @nodoc
abstract mixin class $QuizSessionStateCopyWith<$Res>  {
  factory $QuizSessionStateCopyWith(QuizSessionState value, $Res Function(QuizSessionState) _then) = _$QuizSessionStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, LearningSession? session, String? errorCode, int currentIndex, Map<String, int> selectedAnswers, bool isComplete
});




}
/// @nodoc
class _$QuizSessionStateCopyWithImpl<$Res>
    implements $QuizSessionStateCopyWith<$Res> {
  _$QuizSessionStateCopyWithImpl(this._self, this._then);

  final QuizSessionState _self;
  final $Res Function(QuizSessionState) _then;

/// Create a copy of QuizSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? session = freezed,Object? errorCode = freezed,Object? currentIndex = null,Object? selectedAnswers = null,Object? isComplete = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LearningSession?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedAnswers: null == selectedAnswers ? _self.selectedAnswers : selectedAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, int>,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizSessionState].
extension QuizSessionStatePatterns on QuizSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizSessionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizSessionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizSessionState value)  $default,){
final _that = this;
switch (_that) {
case _QuizSessionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizSessionState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizSessionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  LearningSession? session,  String? errorCode,  int currentIndex,  Map<String, int> selectedAnswers,  bool isComplete)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizSessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.errorCode,_that.currentIndex,_that.selectedAnswers,_that.isComplete);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  LearningSession? session,  String? errorCode,  int currentIndex,  Map<String, int> selectedAnswers,  bool isComplete)  $default,) {final _that = this;
switch (_that) {
case _QuizSessionState():
return $default(_that.isLoading,_that.session,_that.errorCode,_that.currentIndex,_that.selectedAnswers,_that.isComplete);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  LearningSession? session,  String? errorCode,  int currentIndex,  Map<String, int> selectedAnswers,  bool isComplete)?  $default,) {final _that = this;
switch (_that) {
case _QuizSessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.errorCode,_that.currentIndex,_that.selectedAnswers,_that.isComplete);case _:
  return null;

}
}

}

/// @nodoc


class _QuizSessionState extends QuizSessionState {
  const _QuizSessionState({this.isLoading = false, this.session, this.errorCode, this.currentIndex = 0, final  Map<String, int> selectedAnswers = const <String, int>{}, this.isComplete = false}): _selectedAnswers = selectedAnswers,super._();
  

@override@JsonKey() final  bool isLoading;
@override final  LearningSession? session;
@override final  String? errorCode;
@override@JsonKey() final  int currentIndex;
 final  Map<String, int> _selectedAnswers;
@override@JsonKey() Map<String, int> get selectedAnswers {
  if (_selectedAnswers is EqualUnmodifiableMapView) return _selectedAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedAnswers);
}

@override@JsonKey() final  bool isComplete;

/// Create a copy of QuizSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizSessionStateCopyWith<_QuizSessionState> get copyWith => __$QuizSessionStateCopyWithImpl<_QuizSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizSessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other._selectedAnswers, _selectedAnswers)&&(identical(other.isComplete, isComplete) || other.isComplete == isComplete));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,errorCode,currentIndex,const DeepCollectionEquality().hash(_selectedAnswers),isComplete);

@override
String toString() {
  return 'QuizSessionState(isLoading: $isLoading, session: $session, errorCode: $errorCode, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers, isComplete: $isComplete)';
}


}

/// @nodoc
abstract mixin class _$QuizSessionStateCopyWith<$Res> implements $QuizSessionStateCopyWith<$Res> {
  factory _$QuizSessionStateCopyWith(_QuizSessionState value, $Res Function(_QuizSessionState) _then) = __$QuizSessionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, LearningSession? session, String? errorCode, int currentIndex, Map<String, int> selectedAnswers, bool isComplete
});




}
/// @nodoc
class __$QuizSessionStateCopyWithImpl<$Res>
    implements _$QuizSessionStateCopyWith<$Res> {
  __$QuizSessionStateCopyWithImpl(this._self, this._then);

  final _QuizSessionState _self;
  final $Res Function(_QuizSessionState) _then;

/// Create a copy of QuizSessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? session = freezed,Object? errorCode = freezed,Object? currentIndex = null,Object? selectedAnswers = null,Object? isComplete = null,}) {
  return _then(_QuizSessionState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LearningSession?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedAnswers: null == selectedAnswers ? _self._selectedAnswers : selectedAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, int>,isComplete: null == isComplete ? _self.isComplete : isComplete // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
