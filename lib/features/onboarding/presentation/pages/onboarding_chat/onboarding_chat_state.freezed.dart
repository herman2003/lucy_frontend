// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingChatState {

 bool get isInitialized; int get currentStepIndex; String get currentQuestionId; String get activeQuestionText; List<OnboardingChatMessage> get messages; OnboardingChatPhase get phase; String get answerDraft; bool get isSubmitting; String? get pendingTurnSummary; String? get pendingAnswerText; bool get isFallbackConfirmation; List<OnboardingCompletedTurn> get completedTurns; OnboardingAnalyzeResult? get analyzeResult;
/// Create a copy of OnboardingChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingChatStateCopyWith<OnboardingChatState> get copyWith => _$OnboardingChatStateCopyWithImpl<OnboardingChatState>(this as OnboardingChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingChatState&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.currentQuestionId, currentQuestionId) || other.currentQuestionId == currentQuestionId)&&(identical(other.activeQuestionText, activeQuestionText) || other.activeQuestionText == activeQuestionText)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.answerDraft, answerDraft) || other.answerDraft == answerDraft)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.pendingTurnSummary, pendingTurnSummary) || other.pendingTurnSummary == pendingTurnSummary)&&(identical(other.pendingAnswerText, pendingAnswerText) || other.pendingAnswerText == pendingAnswerText)&&(identical(other.isFallbackConfirmation, isFallbackConfirmation) || other.isFallbackConfirmation == isFallbackConfirmation)&&const DeepCollectionEquality().equals(other.completedTurns, completedTurns)&&(identical(other.analyzeResult, analyzeResult) || other.analyzeResult == analyzeResult));
}


@override
int get hashCode => Object.hash(runtimeType,isInitialized,currentStepIndex,currentQuestionId,activeQuestionText,const DeepCollectionEquality().hash(messages),phase,answerDraft,isSubmitting,pendingTurnSummary,pendingAnswerText,isFallbackConfirmation,const DeepCollectionEquality().hash(completedTurns),analyzeResult);

@override
String toString() {
  return 'OnboardingChatState(isInitialized: $isInitialized, currentStepIndex: $currentStepIndex, currentQuestionId: $currentQuestionId, activeQuestionText: $activeQuestionText, messages: $messages, phase: $phase, answerDraft: $answerDraft, isSubmitting: $isSubmitting, pendingTurnSummary: $pendingTurnSummary, pendingAnswerText: $pendingAnswerText, isFallbackConfirmation: $isFallbackConfirmation, completedTurns: $completedTurns, analyzeResult: $analyzeResult)';
}


}

/// @nodoc
abstract mixin class $OnboardingChatStateCopyWith<$Res>  {
  factory $OnboardingChatStateCopyWith(OnboardingChatState value, $Res Function(OnboardingChatState) _then) = _$OnboardingChatStateCopyWithImpl;
@useResult
$Res call({
 bool isInitialized, int currentStepIndex, String currentQuestionId, String activeQuestionText, List<OnboardingChatMessage> messages, OnboardingChatPhase phase, String answerDraft, bool isSubmitting, String? pendingTurnSummary, String? pendingAnswerText, bool isFallbackConfirmation, List<OnboardingCompletedTurn> completedTurns, OnboardingAnalyzeResult? analyzeResult
});


$OnboardingAnalyzeResultCopyWith<$Res>? get analyzeResult;

}
/// @nodoc
class _$OnboardingChatStateCopyWithImpl<$Res>
    implements $OnboardingChatStateCopyWith<$Res> {
  _$OnboardingChatStateCopyWithImpl(this._self, this._then);

  final OnboardingChatState _self;
  final $Res Function(OnboardingChatState) _then;

/// Create a copy of OnboardingChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isInitialized = null,Object? currentStepIndex = null,Object? currentQuestionId = null,Object? activeQuestionText = null,Object? messages = null,Object? phase = null,Object? answerDraft = null,Object? isSubmitting = null,Object? pendingTurnSummary = freezed,Object? pendingAnswerText = freezed,Object? isFallbackConfirmation = null,Object? completedTurns = null,Object? analyzeResult = freezed,}) {
  return _then(_self.copyWith(
isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,currentQuestionId: null == currentQuestionId ? _self.currentQuestionId : currentQuestionId // ignore: cast_nullable_to_non_nullable
as String,activeQuestionText: null == activeQuestionText ? _self.activeQuestionText : activeQuestionText // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<OnboardingChatMessage>,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as OnboardingChatPhase,answerDraft: null == answerDraft ? _self.answerDraft : answerDraft // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,pendingTurnSummary: freezed == pendingTurnSummary ? _self.pendingTurnSummary : pendingTurnSummary // ignore: cast_nullable_to_non_nullable
as String?,pendingAnswerText: freezed == pendingAnswerText ? _self.pendingAnswerText : pendingAnswerText // ignore: cast_nullable_to_non_nullable
as String?,isFallbackConfirmation: null == isFallbackConfirmation ? _self.isFallbackConfirmation : isFallbackConfirmation // ignore: cast_nullable_to_non_nullable
as bool,completedTurns: null == completedTurns ? _self.completedTurns : completedTurns // ignore: cast_nullable_to_non_nullable
as List<OnboardingCompletedTurn>,analyzeResult: freezed == analyzeResult ? _self.analyzeResult : analyzeResult // ignore: cast_nullable_to_non_nullable
as OnboardingAnalyzeResult?,
  ));
}
/// Create a copy of OnboardingChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnboardingAnalyzeResultCopyWith<$Res>? get analyzeResult {
    if (_self.analyzeResult == null) {
    return null;
  }

  return $OnboardingAnalyzeResultCopyWith<$Res>(_self.analyzeResult!, (value) {
    return _then(_self.copyWith(analyzeResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingChatState].
extension OnboardingChatStatePatterns on OnboardingChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingChatState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingChatState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isInitialized,  int currentStepIndex,  String currentQuestionId,  String activeQuestionText,  List<OnboardingChatMessage> messages,  OnboardingChatPhase phase,  String answerDraft,  bool isSubmitting,  String? pendingTurnSummary,  String? pendingAnswerText,  bool isFallbackConfirmation,  List<OnboardingCompletedTurn> completedTurns,  OnboardingAnalyzeResult? analyzeResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingChatState() when $default != null:
return $default(_that.isInitialized,_that.currentStepIndex,_that.currentQuestionId,_that.activeQuestionText,_that.messages,_that.phase,_that.answerDraft,_that.isSubmitting,_that.pendingTurnSummary,_that.pendingAnswerText,_that.isFallbackConfirmation,_that.completedTurns,_that.analyzeResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isInitialized,  int currentStepIndex,  String currentQuestionId,  String activeQuestionText,  List<OnboardingChatMessage> messages,  OnboardingChatPhase phase,  String answerDraft,  bool isSubmitting,  String? pendingTurnSummary,  String? pendingAnswerText,  bool isFallbackConfirmation,  List<OnboardingCompletedTurn> completedTurns,  OnboardingAnalyzeResult? analyzeResult)  $default,) {final _that = this;
switch (_that) {
case _OnboardingChatState():
return $default(_that.isInitialized,_that.currentStepIndex,_that.currentQuestionId,_that.activeQuestionText,_that.messages,_that.phase,_that.answerDraft,_that.isSubmitting,_that.pendingTurnSummary,_that.pendingAnswerText,_that.isFallbackConfirmation,_that.completedTurns,_that.analyzeResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isInitialized,  int currentStepIndex,  String currentQuestionId,  String activeQuestionText,  List<OnboardingChatMessage> messages,  OnboardingChatPhase phase,  String answerDraft,  bool isSubmitting,  String? pendingTurnSummary,  String? pendingAnswerText,  bool isFallbackConfirmation,  List<OnboardingCompletedTurn> completedTurns,  OnboardingAnalyzeResult? analyzeResult)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingChatState() when $default != null:
return $default(_that.isInitialized,_that.currentStepIndex,_that.currentQuestionId,_that.activeQuestionText,_that.messages,_that.phase,_that.answerDraft,_that.isSubmitting,_that.pendingTurnSummary,_that.pendingAnswerText,_that.isFallbackConfirmation,_that.completedTurns,_that.analyzeResult);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingChatState extends OnboardingChatState {
  const _OnboardingChatState({this.isInitialized = false, this.currentStepIndex = 0, this.currentQuestionId = '', this.activeQuestionText = '', final  List<OnboardingChatMessage> messages = const [], this.phase = OnboardingChatPhase.awaitingAnswer, this.answerDraft = '', this.isSubmitting = false, this.pendingTurnSummary, this.pendingAnswerText, this.isFallbackConfirmation = false, final  List<OnboardingCompletedTurn> completedTurns = const [], this.analyzeResult}): _messages = messages,_completedTurns = completedTurns,super._();
  

@override@JsonKey() final  bool isInitialized;
@override@JsonKey() final  int currentStepIndex;
@override@JsonKey() final  String currentQuestionId;
@override@JsonKey() final  String activeQuestionText;
 final  List<OnboardingChatMessage> _messages;
@override@JsonKey() List<OnboardingChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  OnboardingChatPhase phase;
@override@JsonKey() final  String answerDraft;
@override@JsonKey() final  bool isSubmitting;
@override final  String? pendingTurnSummary;
@override final  String? pendingAnswerText;
@override@JsonKey() final  bool isFallbackConfirmation;
 final  List<OnboardingCompletedTurn> _completedTurns;
@override@JsonKey() List<OnboardingCompletedTurn> get completedTurns {
  if (_completedTurns is EqualUnmodifiableListView) return _completedTurns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedTurns);
}

@override final  OnboardingAnalyzeResult? analyzeResult;

/// Create a copy of OnboardingChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingChatStateCopyWith<_OnboardingChatState> get copyWith => __$OnboardingChatStateCopyWithImpl<_OnboardingChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingChatState&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized)&&(identical(other.currentStepIndex, currentStepIndex) || other.currentStepIndex == currentStepIndex)&&(identical(other.currentQuestionId, currentQuestionId) || other.currentQuestionId == currentQuestionId)&&(identical(other.activeQuestionText, activeQuestionText) || other.activeQuestionText == activeQuestionText)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.answerDraft, answerDraft) || other.answerDraft == answerDraft)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.pendingTurnSummary, pendingTurnSummary) || other.pendingTurnSummary == pendingTurnSummary)&&(identical(other.pendingAnswerText, pendingAnswerText) || other.pendingAnswerText == pendingAnswerText)&&(identical(other.isFallbackConfirmation, isFallbackConfirmation) || other.isFallbackConfirmation == isFallbackConfirmation)&&const DeepCollectionEquality().equals(other._completedTurns, _completedTurns)&&(identical(other.analyzeResult, analyzeResult) || other.analyzeResult == analyzeResult));
}


@override
int get hashCode => Object.hash(runtimeType,isInitialized,currentStepIndex,currentQuestionId,activeQuestionText,const DeepCollectionEquality().hash(_messages),phase,answerDraft,isSubmitting,pendingTurnSummary,pendingAnswerText,isFallbackConfirmation,const DeepCollectionEquality().hash(_completedTurns),analyzeResult);

@override
String toString() {
  return 'OnboardingChatState(isInitialized: $isInitialized, currentStepIndex: $currentStepIndex, currentQuestionId: $currentQuestionId, activeQuestionText: $activeQuestionText, messages: $messages, phase: $phase, answerDraft: $answerDraft, isSubmitting: $isSubmitting, pendingTurnSummary: $pendingTurnSummary, pendingAnswerText: $pendingAnswerText, isFallbackConfirmation: $isFallbackConfirmation, completedTurns: $completedTurns, analyzeResult: $analyzeResult)';
}


}

/// @nodoc
abstract mixin class _$OnboardingChatStateCopyWith<$Res> implements $OnboardingChatStateCopyWith<$Res> {
  factory _$OnboardingChatStateCopyWith(_OnboardingChatState value, $Res Function(_OnboardingChatState) _then) = __$OnboardingChatStateCopyWithImpl;
@override @useResult
$Res call({
 bool isInitialized, int currentStepIndex, String currentQuestionId, String activeQuestionText, List<OnboardingChatMessage> messages, OnboardingChatPhase phase, String answerDraft, bool isSubmitting, String? pendingTurnSummary, String? pendingAnswerText, bool isFallbackConfirmation, List<OnboardingCompletedTurn> completedTurns, OnboardingAnalyzeResult? analyzeResult
});


@override $OnboardingAnalyzeResultCopyWith<$Res>? get analyzeResult;

}
/// @nodoc
class __$OnboardingChatStateCopyWithImpl<$Res>
    implements _$OnboardingChatStateCopyWith<$Res> {
  __$OnboardingChatStateCopyWithImpl(this._self, this._then);

  final _OnboardingChatState _self;
  final $Res Function(_OnboardingChatState) _then;

/// Create a copy of OnboardingChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isInitialized = null,Object? currentStepIndex = null,Object? currentQuestionId = null,Object? activeQuestionText = null,Object? messages = null,Object? phase = null,Object? answerDraft = null,Object? isSubmitting = null,Object? pendingTurnSummary = freezed,Object? pendingAnswerText = freezed,Object? isFallbackConfirmation = null,Object? completedTurns = null,Object? analyzeResult = freezed,}) {
  return _then(_OnboardingChatState(
isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,currentStepIndex: null == currentStepIndex ? _self.currentStepIndex : currentStepIndex // ignore: cast_nullable_to_non_nullable
as int,currentQuestionId: null == currentQuestionId ? _self.currentQuestionId : currentQuestionId // ignore: cast_nullable_to_non_nullable
as String,activeQuestionText: null == activeQuestionText ? _self.activeQuestionText : activeQuestionText // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<OnboardingChatMessage>,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as OnboardingChatPhase,answerDraft: null == answerDraft ? _self.answerDraft : answerDraft // ignore: cast_nullable_to_non_nullable
as String,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,pendingTurnSummary: freezed == pendingTurnSummary ? _self.pendingTurnSummary : pendingTurnSummary // ignore: cast_nullable_to_non_nullable
as String?,pendingAnswerText: freezed == pendingAnswerText ? _self.pendingAnswerText : pendingAnswerText // ignore: cast_nullable_to_non_nullable
as String?,isFallbackConfirmation: null == isFallbackConfirmation ? _self.isFallbackConfirmation : isFallbackConfirmation // ignore: cast_nullable_to_non_nullable
as bool,completedTurns: null == completedTurns ? _self._completedTurns : completedTurns // ignore: cast_nullable_to_non_nullable
as List<OnboardingCompletedTurn>,analyzeResult: freezed == analyzeResult ? _self.analyzeResult : analyzeResult // ignore: cast_nullable_to_non_nullable
as OnboardingAnalyzeResult?,
  ));
}

/// Create a copy of OnboardingChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OnboardingAnalyzeResultCopyWith<$Res>? get analyzeResult {
    if (_self.analyzeResult == null) {
    return null;
  }

  return $OnboardingAnalyzeResultCopyWith<$Res>(_self.analyzeResult!, (value) {
    return _then(_self.copyWith(analyzeResult: value));
  });
}
}

// dart format on
