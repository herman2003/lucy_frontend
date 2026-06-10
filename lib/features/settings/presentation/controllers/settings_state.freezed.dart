// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsState {

 bool get isLoading; bool get isSaving; String get fullName; String get email; String? get uiLocale; LearnerProfile? get learnerProfile; String? get errorCode; String? get saveErrorCode;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.uiLocale, uiLocale) || other.uiLocale == uiLocale)&&(identical(other.learnerProfile, learnerProfile) || other.learnerProfile == learnerProfile)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.saveErrorCode, saveErrorCode) || other.saveErrorCode == saveErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSaving,fullName,email,uiLocale,learnerProfile,errorCode,saveErrorCode);

@override
String toString() {
  return 'SettingsState(isLoading: $isLoading, isSaving: $isSaving, fullName: $fullName, email: $email, uiLocale: $uiLocale, learnerProfile: $learnerProfile, errorCode: $errorCode, saveErrorCode: $saveErrorCode)';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSaving, String fullName, String email, String? uiLocale, LearnerProfile? learnerProfile, String? errorCode, String? saveErrorCode
});


$LearnerProfileCopyWith<$Res>? get learnerProfile;

}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSaving = null,Object? fullName = null,Object? email = null,Object? uiLocale = freezed,Object? learnerProfile = freezed,Object? errorCode = freezed,Object? saveErrorCode = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,uiLocale: freezed == uiLocale ? _self.uiLocale : uiLocale // ignore: cast_nullable_to_non_nullable
as String?,learnerProfile: freezed == learnerProfile ? _self.learnerProfile : learnerProfile // ignore: cast_nullable_to_non_nullable
as LearnerProfile?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,saveErrorCode: freezed == saveErrorCode ? _self.saveErrorCode : saveErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearnerProfileCopyWith<$Res>? get learnerProfile {
    if (_self.learnerProfile == null) {
    return null;
  }

  return $LearnerProfileCopyWith<$Res>(_self.learnerProfile!, (value) {
    return _then(_self.copyWith(learnerProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSaving,  String fullName,  String email,  String? uiLocale,  LearnerProfile? learnerProfile,  String? errorCode,  String? saveErrorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.isLoading,_that.isSaving,_that.fullName,_that.email,_that.uiLocale,_that.learnerProfile,_that.errorCode,_that.saveErrorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSaving,  String fullName,  String email,  String? uiLocale,  LearnerProfile? learnerProfile,  String? errorCode,  String? saveErrorCode)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.isLoading,_that.isSaving,_that.fullName,_that.email,_that.uiLocale,_that.learnerProfile,_that.errorCode,_that.saveErrorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSaving,  String fullName,  String email,  String? uiLocale,  LearnerProfile? learnerProfile,  String? errorCode,  String? saveErrorCode)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.isLoading,_that.isSaving,_that.fullName,_that.email,_that.uiLocale,_that.learnerProfile,_that.errorCode,_that.saveErrorCode);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsState implements SettingsState {
  const _SettingsState({this.isLoading = false, this.isSaving = false, this.fullName = '', this.email = '', this.uiLocale, this.learnerProfile, this.errorCode, this.saveErrorCode});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String email;
@override final  String? uiLocale;
@override final  LearnerProfile? learnerProfile;
@override final  String? errorCode;
@override final  String? saveErrorCode;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.uiLocale, uiLocale) || other.uiLocale == uiLocale)&&(identical(other.learnerProfile, learnerProfile) || other.learnerProfile == learnerProfile)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode)&&(identical(other.saveErrorCode, saveErrorCode) || other.saveErrorCode == saveErrorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSaving,fullName,email,uiLocale,learnerProfile,errorCode,saveErrorCode);

@override
String toString() {
  return 'SettingsState(isLoading: $isLoading, isSaving: $isSaving, fullName: $fullName, email: $email, uiLocale: $uiLocale, learnerProfile: $learnerProfile, errorCode: $errorCode, saveErrorCode: $saveErrorCode)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSaving, String fullName, String email, String? uiLocale, LearnerProfile? learnerProfile, String? errorCode, String? saveErrorCode
});


@override $LearnerProfileCopyWith<$Res>? get learnerProfile;

}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSaving = null,Object? fullName = null,Object? email = null,Object? uiLocale = freezed,Object? learnerProfile = freezed,Object? errorCode = freezed,Object? saveErrorCode = freezed,}) {
  return _then(_SettingsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,uiLocale: freezed == uiLocale ? _self.uiLocale : uiLocale // ignore: cast_nullable_to_non_nullable
as String?,learnerProfile: freezed == learnerProfile ? _self.learnerProfile : learnerProfile // ignore: cast_nullable_to_non_nullable
as LearnerProfile?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,saveErrorCode: freezed == saveErrorCode ? _self.saveErrorCode : saveErrorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LearnerProfileCopyWith<$Res>? get learnerProfile {
    if (_self.learnerProfile == null) {
    return null;
  }

  return $LearnerProfileCopyWith<$Res>(_self.learnerProfile!, (value) {
    return _then(_self.copyWith(learnerProfile: value));
  });
}
}

// dart format on
