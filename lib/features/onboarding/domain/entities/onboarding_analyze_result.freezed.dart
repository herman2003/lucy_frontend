// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_analyze_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingAnalyzeResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingAnalyzeResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingAnalyzeResult()';
}


}

/// @nodoc
class $OnboardingAnalyzeResultCopyWith<$Res>  {
$OnboardingAnalyzeResultCopyWith(OnboardingAnalyzeResult _, $Res Function(OnboardingAnalyzeResult) __);
}


/// Adds pattern-matching-related methods to [OnboardingAnalyzeResult].
extension OnboardingAnalyzeResultPatterns on OnboardingAnalyzeResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingAnalyzeSuccess value)?  success,TResult Function( OnboardingAnalyzeFallback value)?  fallback,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingAnalyzeSuccess() when success != null:
return success(_that);case OnboardingAnalyzeFallback() when fallback != null:
return fallback(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingAnalyzeSuccess value)  success,required TResult Function( OnboardingAnalyzeFallback value)  fallback,}){
final _that = this;
switch (_that) {
case OnboardingAnalyzeSuccess():
return success(_that);case OnboardingAnalyzeFallback():
return fallback(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingAnalyzeSuccess value)?  success,TResult? Function( OnboardingAnalyzeFallback value)?  fallback,}){
final _that = this;
switch (_that) {
case OnboardingAnalyzeSuccess() when success != null:
return success(_that);case OnboardingAnalyzeFallback() when fallback != null:
return fallback(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LearnerProfile learnerProfile,  String summaryForUser)?  success,TResult Function( String fallbackProfileSummary)?  fallback,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingAnalyzeSuccess() when success != null:
return success(_that.learnerProfile,_that.summaryForUser);case OnboardingAnalyzeFallback() when fallback != null:
return fallback(_that.fallbackProfileSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LearnerProfile learnerProfile,  String summaryForUser)  success,required TResult Function( String fallbackProfileSummary)  fallback,}) {final _that = this;
switch (_that) {
case OnboardingAnalyzeSuccess():
return success(_that.learnerProfile,_that.summaryForUser);case OnboardingAnalyzeFallback():
return fallback(_that.fallbackProfileSummary);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LearnerProfile learnerProfile,  String summaryForUser)?  success,TResult? Function( String fallbackProfileSummary)?  fallback,}) {final _that = this;
switch (_that) {
case OnboardingAnalyzeSuccess() when success != null:
return success(_that.learnerProfile,_that.summaryForUser);case OnboardingAnalyzeFallback() when fallback != null:
return fallback(_that.fallbackProfileSummary);case _:
  return null;

}
}

}

/// @nodoc


class OnboardingAnalyzeSuccess implements OnboardingAnalyzeResult {
  const OnboardingAnalyzeSuccess({required this.learnerProfile, required this.summaryForUser});
  

 final  LearnerProfile learnerProfile;
 final  String summaryForUser;

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingAnalyzeSuccessCopyWith<OnboardingAnalyzeSuccess> get copyWith => _$OnboardingAnalyzeSuccessCopyWithImpl<OnboardingAnalyzeSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingAnalyzeSuccess&&(identical(other.learnerProfile, learnerProfile) || other.learnerProfile == learnerProfile)&&(identical(other.summaryForUser, summaryForUser) || other.summaryForUser == summaryForUser));
}


@override
int get hashCode => Object.hash(runtimeType,learnerProfile,summaryForUser);

@override
String toString() {
  return 'OnboardingAnalyzeResult.success(learnerProfile: $learnerProfile, summaryForUser: $summaryForUser)';
}


}

/// @nodoc
abstract mixin class $OnboardingAnalyzeSuccessCopyWith<$Res> implements $OnboardingAnalyzeResultCopyWith<$Res> {
  factory $OnboardingAnalyzeSuccessCopyWith(OnboardingAnalyzeSuccess value, $Res Function(OnboardingAnalyzeSuccess) _then) = _$OnboardingAnalyzeSuccessCopyWithImpl;
@useResult
$Res call({
 LearnerProfile learnerProfile, String summaryForUser
});


$LearnerProfileCopyWith<$Res> get learnerProfile;

}
/// @nodoc
class _$OnboardingAnalyzeSuccessCopyWithImpl<$Res>
    implements $OnboardingAnalyzeSuccessCopyWith<$Res> {
  _$OnboardingAnalyzeSuccessCopyWithImpl(this._self, this._then);

  final OnboardingAnalyzeSuccess _self;
  final $Res Function(OnboardingAnalyzeSuccess) _then;

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? learnerProfile = null,Object? summaryForUser = null,}) {
  return _then(OnboardingAnalyzeSuccess(
learnerProfile: null == learnerProfile ? _self.learnerProfile : learnerProfile // ignore: cast_nullable_to_non_nullable
as LearnerProfile,summaryForUser: null == summaryForUser ? _self.summaryForUser : summaryForUser // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearnerProfileCopyWith<$Res> get learnerProfile {
  
  return $LearnerProfileCopyWith<$Res>(_self.learnerProfile, (value) {
    return _then(_self.copyWith(learnerProfile: value));
  });
}
}

/// @nodoc


class OnboardingAnalyzeFallback implements OnboardingAnalyzeResult {
  const OnboardingAnalyzeFallback({required this.fallbackProfileSummary});
  

 final  String fallbackProfileSummary;

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingAnalyzeFallbackCopyWith<OnboardingAnalyzeFallback> get copyWith => _$OnboardingAnalyzeFallbackCopyWithImpl<OnboardingAnalyzeFallback>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingAnalyzeFallback&&(identical(other.fallbackProfileSummary, fallbackProfileSummary) || other.fallbackProfileSummary == fallbackProfileSummary));
}


@override
int get hashCode => Object.hash(runtimeType,fallbackProfileSummary);

@override
String toString() {
  return 'OnboardingAnalyzeResult.fallback(fallbackProfileSummary: $fallbackProfileSummary)';
}


}

/// @nodoc
abstract mixin class $OnboardingAnalyzeFallbackCopyWith<$Res> implements $OnboardingAnalyzeResultCopyWith<$Res> {
  factory $OnboardingAnalyzeFallbackCopyWith(OnboardingAnalyzeFallback value, $Res Function(OnboardingAnalyzeFallback) _then) = _$OnboardingAnalyzeFallbackCopyWithImpl;
@useResult
$Res call({
 String fallbackProfileSummary
});




}
/// @nodoc
class _$OnboardingAnalyzeFallbackCopyWithImpl<$Res>
    implements $OnboardingAnalyzeFallbackCopyWith<$Res> {
  _$OnboardingAnalyzeFallbackCopyWithImpl(this._self, this._then);

  final OnboardingAnalyzeFallback _self;
  final $Res Function(OnboardingAnalyzeFallback) _then;

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fallbackProfileSummary = null,}) {
  return _then(OnboardingAnalyzeFallback(
fallbackProfileSummary: null == fallbackProfileSummary ? _self.fallbackProfileSummary : fallbackProfileSummary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
