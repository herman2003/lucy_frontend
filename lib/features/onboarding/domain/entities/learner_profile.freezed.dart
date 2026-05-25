// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learner_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearnerProfile {

 String get primaryRole; List<String> get mainDomains; String get learningGoal; String get selfAssessedLevel; String get explanationStyle; String get feedbackTone; String get tutoringLanguage;
/// Create a copy of LearnerProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearnerProfileCopyWith<LearnerProfile> get copyWith => _$LearnerProfileCopyWithImpl<LearnerProfile>(this as LearnerProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearnerProfile&&(identical(other.primaryRole, primaryRole) || other.primaryRole == primaryRole)&&const DeepCollectionEquality().equals(other.mainDomains, mainDomains)&&(identical(other.learningGoal, learningGoal) || other.learningGoal == learningGoal)&&(identical(other.selfAssessedLevel, selfAssessedLevel) || other.selfAssessedLevel == selfAssessedLevel)&&(identical(other.explanationStyle, explanationStyle) || other.explanationStyle == explanationStyle)&&(identical(other.feedbackTone, feedbackTone) || other.feedbackTone == feedbackTone)&&(identical(other.tutoringLanguage, tutoringLanguage) || other.tutoringLanguage == tutoringLanguage));
}


@override
int get hashCode => Object.hash(runtimeType,primaryRole,const DeepCollectionEquality().hash(mainDomains),learningGoal,selfAssessedLevel,explanationStyle,feedbackTone,tutoringLanguage);

@override
String toString() {
  return 'LearnerProfile(primaryRole: $primaryRole, mainDomains: $mainDomains, learningGoal: $learningGoal, selfAssessedLevel: $selfAssessedLevel, explanationStyle: $explanationStyle, feedbackTone: $feedbackTone, tutoringLanguage: $tutoringLanguage)';
}


}

/// @nodoc
abstract mixin class $LearnerProfileCopyWith<$Res>  {
  factory $LearnerProfileCopyWith(LearnerProfile value, $Res Function(LearnerProfile) _then) = _$LearnerProfileCopyWithImpl;
@useResult
$Res call({
 String primaryRole, List<String> mainDomains, String learningGoal, String selfAssessedLevel, String explanationStyle, String feedbackTone, String tutoringLanguage
});




}
/// @nodoc
class _$LearnerProfileCopyWithImpl<$Res>
    implements $LearnerProfileCopyWith<$Res> {
  _$LearnerProfileCopyWithImpl(this._self, this._then);

  final LearnerProfile _self;
  final $Res Function(LearnerProfile) _then;

/// Create a copy of LearnerProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaryRole = null,Object? mainDomains = null,Object? learningGoal = null,Object? selfAssessedLevel = null,Object? explanationStyle = null,Object? feedbackTone = null,Object? tutoringLanguage = null,}) {
  return _then(_self.copyWith(
primaryRole: null == primaryRole ? _self.primaryRole : primaryRole // ignore: cast_nullable_to_non_nullable
as String,mainDomains: null == mainDomains ? _self.mainDomains : mainDomains // ignore: cast_nullable_to_non_nullable
as List<String>,learningGoal: null == learningGoal ? _self.learningGoal : learningGoal // ignore: cast_nullable_to_non_nullable
as String,selfAssessedLevel: null == selfAssessedLevel ? _self.selfAssessedLevel : selfAssessedLevel // ignore: cast_nullable_to_non_nullable
as String,explanationStyle: null == explanationStyle ? _self.explanationStyle : explanationStyle // ignore: cast_nullable_to_non_nullable
as String,feedbackTone: null == feedbackTone ? _self.feedbackTone : feedbackTone // ignore: cast_nullable_to_non_nullable
as String,tutoringLanguage: null == tutoringLanguage ? _self.tutoringLanguage : tutoringLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LearnerProfile].
extension LearnerProfilePatterns on LearnerProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearnerProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearnerProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearnerProfile value)  $default,){
final _that = this;
switch (_that) {
case _LearnerProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearnerProfile value)?  $default,){
final _that = this;
switch (_that) {
case _LearnerProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String primaryRole,  List<String> mainDomains,  String learningGoal,  String selfAssessedLevel,  String explanationStyle,  String feedbackTone,  String tutoringLanguage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearnerProfile() when $default != null:
return $default(_that.primaryRole,_that.mainDomains,_that.learningGoal,_that.selfAssessedLevel,_that.explanationStyle,_that.feedbackTone,_that.tutoringLanguage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String primaryRole,  List<String> mainDomains,  String learningGoal,  String selfAssessedLevel,  String explanationStyle,  String feedbackTone,  String tutoringLanguage)  $default,) {final _that = this;
switch (_that) {
case _LearnerProfile():
return $default(_that.primaryRole,_that.mainDomains,_that.learningGoal,_that.selfAssessedLevel,_that.explanationStyle,_that.feedbackTone,_that.tutoringLanguage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String primaryRole,  List<String> mainDomains,  String learningGoal,  String selfAssessedLevel,  String explanationStyle,  String feedbackTone,  String tutoringLanguage)?  $default,) {final _that = this;
switch (_that) {
case _LearnerProfile() when $default != null:
return $default(_that.primaryRole,_that.mainDomains,_that.learningGoal,_that.selfAssessedLevel,_that.explanationStyle,_that.feedbackTone,_that.tutoringLanguage);case _:
  return null;

}
}

}

/// @nodoc


class _LearnerProfile implements LearnerProfile {
  const _LearnerProfile({required this.primaryRole, required final  List<String> mainDomains, required this.learningGoal, required this.selfAssessedLevel, required this.explanationStyle, required this.feedbackTone, required this.tutoringLanguage}): _mainDomains = mainDomains;
  

@override final  String primaryRole;
 final  List<String> _mainDomains;
@override List<String> get mainDomains {
  if (_mainDomains is EqualUnmodifiableListView) return _mainDomains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mainDomains);
}

@override final  String learningGoal;
@override final  String selfAssessedLevel;
@override final  String explanationStyle;
@override final  String feedbackTone;
@override final  String tutoringLanguage;

/// Create a copy of LearnerProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearnerProfileCopyWith<_LearnerProfile> get copyWith => __$LearnerProfileCopyWithImpl<_LearnerProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearnerProfile&&(identical(other.primaryRole, primaryRole) || other.primaryRole == primaryRole)&&const DeepCollectionEquality().equals(other._mainDomains, _mainDomains)&&(identical(other.learningGoal, learningGoal) || other.learningGoal == learningGoal)&&(identical(other.selfAssessedLevel, selfAssessedLevel) || other.selfAssessedLevel == selfAssessedLevel)&&(identical(other.explanationStyle, explanationStyle) || other.explanationStyle == explanationStyle)&&(identical(other.feedbackTone, feedbackTone) || other.feedbackTone == feedbackTone)&&(identical(other.tutoringLanguage, tutoringLanguage) || other.tutoringLanguage == tutoringLanguage));
}


@override
int get hashCode => Object.hash(runtimeType,primaryRole,const DeepCollectionEquality().hash(_mainDomains),learningGoal,selfAssessedLevel,explanationStyle,feedbackTone,tutoringLanguage);

@override
String toString() {
  return 'LearnerProfile(primaryRole: $primaryRole, mainDomains: $mainDomains, learningGoal: $learningGoal, selfAssessedLevel: $selfAssessedLevel, explanationStyle: $explanationStyle, feedbackTone: $feedbackTone, tutoringLanguage: $tutoringLanguage)';
}


}

/// @nodoc
abstract mixin class _$LearnerProfileCopyWith<$Res> implements $LearnerProfileCopyWith<$Res> {
  factory _$LearnerProfileCopyWith(_LearnerProfile value, $Res Function(_LearnerProfile) _then) = __$LearnerProfileCopyWithImpl;
@override @useResult
$Res call({
 String primaryRole, List<String> mainDomains, String learningGoal, String selfAssessedLevel, String explanationStyle, String feedbackTone, String tutoringLanguage
});




}
/// @nodoc
class __$LearnerProfileCopyWithImpl<$Res>
    implements _$LearnerProfileCopyWith<$Res> {
  __$LearnerProfileCopyWithImpl(this._self, this._then);

  final _LearnerProfile _self;
  final $Res Function(_LearnerProfile) _then;

/// Create a copy of LearnerProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primaryRole = null,Object? mainDomains = null,Object? learningGoal = null,Object? selfAssessedLevel = null,Object? explanationStyle = null,Object? feedbackTone = null,Object? tutoringLanguage = null,}) {
  return _then(_LearnerProfile(
primaryRole: null == primaryRole ? _self.primaryRole : primaryRole // ignore: cast_nullable_to_non_nullable
as String,mainDomains: null == mainDomains ? _self._mainDomains : mainDomains // ignore: cast_nullable_to_non_nullable
as List<String>,learningGoal: null == learningGoal ? _self.learningGoal : learningGoal // ignore: cast_nullable_to_non_nullable
as String,selfAssessedLevel: null == selfAssessedLevel ? _self.selfAssessedLevel : selfAssessedLevel // ignore: cast_nullable_to_non_nullable
as String,explanationStyle: null == explanationStyle ? _self.explanationStyle : explanationStyle // ignore: cast_nullable_to_non_nullable
as String,feedbackTone: null == feedbackTone ? _self.feedbackTone : feedbackTone // ignore: cast_nullable_to_non_nullable
as String,tutoringLanguage: null == tutoringLanguage ? _self.tutoringLanguage : tutoringLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
