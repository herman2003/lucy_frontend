// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizState {

 bool get isLoading; QuizEligibility? get eligibility; List<LearningSessionListItem> get sessions; Map<String, QuizAttempt> get lastQuizAttempts; String? get errorCode;
/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizStateCopyWith<QuizState> get copyWith => _$QuizStateCopyWithImpl<QuizState>(this as QuizState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&const DeepCollectionEquality().equals(other.lastQuizAttempts, lastQuizAttempts)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,eligibility,const DeepCollectionEquality().hash(sessions),const DeepCollectionEquality().hash(lastQuizAttempts),errorCode);

@override
String toString() {
  return 'QuizState(isLoading: $isLoading, eligibility: $eligibility, sessions: $sessions, lastQuizAttempts: $lastQuizAttempts, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $QuizStateCopyWith<$Res>  {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) _then) = _$QuizStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, QuizEligibility? eligibility, List<LearningSessionListItem> sessions, Map<String, QuizAttempt> lastQuizAttempts, String? errorCode
});




}
/// @nodoc
class _$QuizStateCopyWithImpl<$Res>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._self, this._then);

  final QuizState _self;
  final $Res Function(QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? eligibility = freezed,Object? sessions = null,Object? lastQuizAttempts = null,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as QuizEligibility?,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<LearningSessionListItem>,lastQuizAttempts: null == lastQuizAttempts ? _self.lastQuizAttempts : lastQuizAttempts // ignore: cast_nullable_to_non_nullable
as Map<String, QuizAttempt>,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizState].
extension QuizStatePatterns on QuizState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizState value)  $default,){
final _that = this;
switch (_that) {
case _QuizState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizState value)?  $default,){
final _that = this;
switch (_that) {
case _QuizState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  QuizEligibility? eligibility,  List<LearningSessionListItem> sessions,  Map<String, QuizAttempt> lastQuizAttempts,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.isLoading,_that.eligibility,_that.sessions,_that.lastQuizAttempts,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  QuizEligibility? eligibility,  List<LearningSessionListItem> sessions,  Map<String, QuizAttempt> lastQuizAttempts,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _QuizState():
return $default(_that.isLoading,_that.eligibility,_that.sessions,_that.lastQuizAttempts,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  QuizEligibility? eligibility,  List<LearningSessionListItem> sessions,  Map<String, QuizAttempt> lastQuizAttempts,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _QuizState() when $default != null:
return $default(_that.isLoading,_that.eligibility,_that.sessions,_that.lastQuizAttempts,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _QuizState extends QuizState {
  const _QuizState({this.isLoading = false, this.eligibility, final  List<LearningSessionListItem> sessions = const <LearningSessionListItem>[], final  Map<String, QuizAttempt> lastQuizAttempts = const <String, QuizAttempt>{}, this.errorCode}): _sessions = sessions,_lastQuizAttempts = lastQuizAttempts,super._();
  

@override@JsonKey() final  bool isLoading;
@override final  QuizEligibility? eligibility;
 final  List<LearningSessionListItem> _sessions;
@override@JsonKey() List<LearningSessionListItem> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

 final  Map<String, QuizAttempt> _lastQuizAttempts;
@override@JsonKey() Map<String, QuizAttempt> get lastQuizAttempts {
  if (_lastQuizAttempts is EqualUnmodifiableMapView) return _lastQuizAttempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_lastQuizAttempts);
}

@override final  String? errorCode;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizStateCopyWith<_QuizState> get copyWith => __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&const DeepCollectionEquality().equals(other._lastQuizAttempts, _lastQuizAttempts)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,eligibility,const DeepCollectionEquality().hash(_sessions),const DeepCollectionEquality().hash(_lastQuizAttempts),errorCode);

@override
String toString() {
  return 'QuizState(isLoading: $isLoading, eligibility: $eligibility, sessions: $sessions, lastQuizAttempts: $lastQuizAttempts, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(_QuizState value, $Res Function(_QuizState) _then) = __$QuizStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, QuizEligibility? eligibility, List<LearningSessionListItem> sessions, Map<String, QuizAttempt> lastQuizAttempts, String? errorCode
});




}
/// @nodoc
class __$QuizStateCopyWithImpl<$Res>
    implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(this._self, this._then);

  final _QuizState _self;
  final $Res Function(_QuizState) _then;

/// Create a copy of QuizState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? eligibility = freezed,Object? sessions = null,Object? lastQuizAttempts = null,Object? errorCode = freezed,}) {
  return _then(_QuizState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as QuizEligibility?,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<LearningSessionListItem>,lastQuizAttempts: null == lastQuizAttempts ? _self._lastQuizAttempts : lastQuizAttempts // ignore: cast_nullable_to_non_nullable
as Map<String, QuizAttempt>,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
