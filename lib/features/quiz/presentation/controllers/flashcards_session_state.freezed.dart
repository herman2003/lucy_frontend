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

 bool get isLoading; LearningSession? get session; String? get errorCode; List<int> get studyQueue; int get queuePosition; bool get isFlipped; bool get awaitingRating; bool get isSessionComplete; Map<String, FlashcardSm2State> get sm2States;
/// Create a copy of FlashcardsSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardsSessionStateCopyWith<FlashcardsSessionState> get copyWith => _$FlashcardsSessionStateCopyWithImpl<FlashcardsSessionState>(this as FlashcardsSessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardsSessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&const DeepCollectionEquality().equals(other.studyQueue, studyQueue)&&(identical(other.queuePosition, queuePosition) || other.queuePosition == queuePosition)&&(identical(other.isFlipped, isFlipped) || other.isFlipped == isFlipped)&&(identical(other.awaitingRating, awaitingRating) || other.awaitingRating == awaitingRating)&&(identical(other.isSessionComplete, isSessionComplete) || other.isSessionComplete == isSessionComplete)&&const DeepCollectionEquality().equals(other.sm2States, sm2States));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,errorCode,const DeepCollectionEquality().hash(studyQueue),queuePosition,isFlipped,awaitingRating,isSessionComplete,const DeepCollectionEquality().hash(sm2States));

@override
String toString() {
  return 'FlashcardsSessionState(isLoading: $isLoading, session: $session, errorCode: $errorCode, studyQueue: $studyQueue, queuePosition: $queuePosition, isFlipped: $isFlipped, awaitingRating: $awaitingRating, isSessionComplete: $isSessionComplete, sm2States: $sm2States)';
}


}

/// @nodoc
abstract mixin class $FlashcardsSessionStateCopyWith<$Res>  {
  factory $FlashcardsSessionStateCopyWith(FlashcardsSessionState value, $Res Function(FlashcardsSessionState) _then) = _$FlashcardsSessionStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, LearningSession? session, String? errorCode, List<int> studyQueue, int queuePosition, bool isFlipped, bool awaitingRating, bool isSessionComplete, Map<String, FlashcardSm2State> sm2States
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
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? session = freezed,Object? errorCode = freezed,Object? studyQueue = null,Object? queuePosition = null,Object? isFlipped = null,Object? awaitingRating = null,Object? isSessionComplete = null,Object? sm2States = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LearningSession?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,studyQueue: null == studyQueue ? _self.studyQueue : studyQueue // ignore: cast_nullable_to_non_nullable
as List<int>,queuePosition: null == queuePosition ? _self.queuePosition : queuePosition // ignore: cast_nullable_to_non_nullable
as int,isFlipped: null == isFlipped ? _self.isFlipped : isFlipped // ignore: cast_nullable_to_non_nullable
as bool,awaitingRating: null == awaitingRating ? _self.awaitingRating : awaitingRating // ignore: cast_nullable_to_non_nullable
as bool,isSessionComplete: null == isSessionComplete ? _self.isSessionComplete : isSessionComplete // ignore: cast_nullable_to_non_nullable
as bool,sm2States: null == sm2States ? _self.sm2States : sm2States // ignore: cast_nullable_to_non_nullable
as Map<String, FlashcardSm2State>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  LearningSession? session,  String? errorCode,  List<int> studyQueue,  int queuePosition,  bool isFlipped,  bool awaitingRating,  bool isSessionComplete,  Map<String, FlashcardSm2State> sm2States)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardsSessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.errorCode,_that.studyQueue,_that.queuePosition,_that.isFlipped,_that.awaitingRating,_that.isSessionComplete,_that.sm2States);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  LearningSession? session,  String? errorCode,  List<int> studyQueue,  int queuePosition,  bool isFlipped,  bool awaitingRating,  bool isSessionComplete,  Map<String, FlashcardSm2State> sm2States)  $default,) {final _that = this;
switch (_that) {
case _FlashcardsSessionState():
return $default(_that.isLoading,_that.session,_that.errorCode,_that.studyQueue,_that.queuePosition,_that.isFlipped,_that.awaitingRating,_that.isSessionComplete,_that.sm2States);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  LearningSession? session,  String? errorCode,  List<int> studyQueue,  int queuePosition,  bool isFlipped,  bool awaitingRating,  bool isSessionComplete,  Map<String, FlashcardSm2State> sm2States)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardsSessionState() when $default != null:
return $default(_that.isLoading,_that.session,_that.errorCode,_that.studyQueue,_that.queuePosition,_that.isFlipped,_that.awaitingRating,_that.isSessionComplete,_that.sm2States);case _:
  return null;

}
}

}

/// @nodoc


class _FlashcardsSessionState extends FlashcardsSessionState {
  const _FlashcardsSessionState({this.isLoading = false, this.session, this.errorCode, final  List<int> studyQueue = const <int>[], this.queuePosition = 0, this.isFlipped = false, this.awaitingRating = false, this.isSessionComplete = false, final  Map<String, FlashcardSm2State> sm2States = const <String, FlashcardSm2State>{}}): _studyQueue = studyQueue,_sm2States = sm2States,super._();
  

@override@JsonKey() final  bool isLoading;
@override final  LearningSession? session;
@override final  String? errorCode;
 final  List<int> _studyQueue;
@override@JsonKey() List<int> get studyQueue {
  if (_studyQueue is EqualUnmodifiableListView) return _studyQueue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_studyQueue);
}

@override@JsonKey() final  int queuePosition;
@override@JsonKey() final  bool isFlipped;
@override@JsonKey() final  bool awaitingRating;
@override@JsonKey() final  bool isSessionComplete;
 final  Map<String, FlashcardSm2State> _sm2States;
@override@JsonKey() Map<String, FlashcardSm2State> get sm2States {
  if (_sm2States is EqualUnmodifiableMapView) return _sm2States;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_sm2States);
}


/// Create a copy of FlashcardsSessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardsSessionStateCopyWith<_FlashcardsSessionState> get copyWith => __$FlashcardsSessionStateCopyWithImpl<_FlashcardsSessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardsSessionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.session, session) || other.session == session)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&const DeepCollectionEquality().equals(other._studyQueue, _studyQueue)&&(identical(other.queuePosition, queuePosition) || other.queuePosition == queuePosition)&&(identical(other.isFlipped, isFlipped) || other.isFlipped == isFlipped)&&(identical(other.awaitingRating, awaitingRating) || other.awaitingRating == awaitingRating)&&(identical(other.isSessionComplete, isSessionComplete) || other.isSessionComplete == isSessionComplete)&&const DeepCollectionEquality().equals(other._sm2States, _sm2States));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,session,errorCode,const DeepCollectionEquality().hash(_studyQueue),queuePosition,isFlipped,awaitingRating,isSessionComplete,const DeepCollectionEquality().hash(_sm2States));

@override
String toString() {
  return 'FlashcardsSessionState(isLoading: $isLoading, session: $session, errorCode: $errorCode, studyQueue: $studyQueue, queuePosition: $queuePosition, isFlipped: $isFlipped, awaitingRating: $awaitingRating, isSessionComplete: $isSessionComplete, sm2States: $sm2States)';
}


}

/// @nodoc
abstract mixin class _$FlashcardsSessionStateCopyWith<$Res> implements $FlashcardsSessionStateCopyWith<$Res> {
  factory _$FlashcardsSessionStateCopyWith(_FlashcardsSessionState value, $Res Function(_FlashcardsSessionState) _then) = __$FlashcardsSessionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, LearningSession? session, String? errorCode, List<int> studyQueue, int queuePosition, bool isFlipped, bool awaitingRating, bool isSessionComplete, Map<String, FlashcardSm2State> sm2States
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
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? session = freezed,Object? errorCode = freezed,Object? studyQueue = null,Object? queuePosition = null,Object? isFlipped = null,Object? awaitingRating = null,Object? isSessionComplete = null,Object? sm2States = null,}) {
  return _then(_FlashcardsSessionState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as LearningSession?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,studyQueue: null == studyQueue ? _self._studyQueue : studyQueue // ignore: cast_nullable_to_non_nullable
as List<int>,queuePosition: null == queuePosition ? _self.queuePosition : queuePosition // ignore: cast_nullable_to_non_nullable
as int,isFlipped: null == isFlipped ? _self.isFlipped : isFlipped // ignore: cast_nullable_to_non_nullable
as bool,awaitingRating: null == awaitingRating ? _self.awaitingRating : awaitingRating // ignore: cast_nullable_to_non_nullable
as bool,isSessionComplete: null == isSessionComplete ? _self.isSessionComplete : isSessionComplete // ignore: cast_nullable_to_non_nullable
as bool,sm2States: null == sm2States ? _self._sm2States : sm2States // ignore: cast_nullable_to_non_nullable
as Map<String, FlashcardSm2State>,
  ));
}


}

// dart format on
