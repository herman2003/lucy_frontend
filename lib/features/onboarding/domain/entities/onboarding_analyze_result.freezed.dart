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

 LearnerProfile get learnerProfile; String get summaryForUser;
/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingAnalyzeResultCopyWith<OnboardingAnalyzeResult> get copyWith => _$OnboardingAnalyzeResultCopyWithImpl<OnboardingAnalyzeResult>(this as OnboardingAnalyzeResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingAnalyzeResult&&(identical(other.learnerProfile, learnerProfile) || other.learnerProfile == learnerProfile)&&(identical(other.summaryForUser, summaryForUser) || other.summaryForUser == summaryForUser));
}


@override
int get hashCode => Object.hash(runtimeType,learnerProfile,summaryForUser);

@override
String toString() {
  return 'OnboardingAnalyzeResult(learnerProfile: $learnerProfile, summaryForUser: $summaryForUser)';
}


}

/// @nodoc
abstract mixin class $OnboardingAnalyzeResultCopyWith<$Res>  {
  factory $OnboardingAnalyzeResultCopyWith(OnboardingAnalyzeResult value, $Res Function(OnboardingAnalyzeResult) _then) = _$OnboardingAnalyzeResultCopyWithImpl;
@useResult
$Res call({
 LearnerProfile learnerProfile, String summaryForUser
});


$LearnerProfileCopyWith<$Res> get learnerProfile;

}
/// @nodoc
class _$OnboardingAnalyzeResultCopyWithImpl<$Res>
    implements $OnboardingAnalyzeResultCopyWith<$Res> {
  _$OnboardingAnalyzeResultCopyWithImpl(this._self, this._then);

  final OnboardingAnalyzeResult _self;
  final $Res Function(OnboardingAnalyzeResult) _then;

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? learnerProfile = null,Object? summaryForUser = null,}) {
  return _then(_self.copyWith(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingAnalyzeResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingAnalyzeResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingAnalyzeResult value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingAnalyzeResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingAnalyzeResult value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingAnalyzeResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LearnerProfile learnerProfile,  String summaryForUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingAnalyzeResult() when $default != null:
return $default(_that.learnerProfile,_that.summaryForUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LearnerProfile learnerProfile,  String summaryForUser)  $default,) {final _that = this;
switch (_that) {
case _OnboardingAnalyzeResult():
return $default(_that.learnerProfile,_that.summaryForUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LearnerProfile learnerProfile,  String summaryForUser)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingAnalyzeResult() when $default != null:
return $default(_that.learnerProfile,_that.summaryForUser);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingAnalyzeResult implements OnboardingAnalyzeResult {
  const _OnboardingAnalyzeResult({required this.learnerProfile, required this.summaryForUser});
  

@override final  LearnerProfile learnerProfile;
@override final  String summaryForUser;

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingAnalyzeResultCopyWith<_OnboardingAnalyzeResult> get copyWith => __$OnboardingAnalyzeResultCopyWithImpl<_OnboardingAnalyzeResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingAnalyzeResult&&(identical(other.learnerProfile, learnerProfile) || other.learnerProfile == learnerProfile)&&(identical(other.summaryForUser, summaryForUser) || other.summaryForUser == summaryForUser));
}


@override
int get hashCode => Object.hash(runtimeType,learnerProfile,summaryForUser);

@override
String toString() {
  return 'OnboardingAnalyzeResult(learnerProfile: $learnerProfile, summaryForUser: $summaryForUser)';
}


}

/// @nodoc
abstract mixin class _$OnboardingAnalyzeResultCopyWith<$Res> implements $OnboardingAnalyzeResultCopyWith<$Res> {
  factory _$OnboardingAnalyzeResultCopyWith(_OnboardingAnalyzeResult value, $Res Function(_OnboardingAnalyzeResult) _then) = __$OnboardingAnalyzeResultCopyWithImpl;
@override @useResult
$Res call({
 LearnerProfile learnerProfile, String summaryForUser
});


@override $LearnerProfileCopyWith<$Res> get learnerProfile;

}
/// @nodoc
class __$OnboardingAnalyzeResultCopyWithImpl<$Res>
    implements _$OnboardingAnalyzeResultCopyWith<$Res> {
  __$OnboardingAnalyzeResultCopyWithImpl(this._self, this._then);

  final _OnboardingAnalyzeResult _self;
  final $Res Function(_OnboardingAnalyzeResult) _then;

/// Create a copy of OnboardingAnalyzeResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? learnerProfile = null,Object? summaryForUser = null,}) {
  return _then(_OnboardingAnalyzeResult(
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

// dart format on
