// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lucy_theme_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LucyThemePreferences {

 LucyInterfaceStyle get interfaceStyle; ThemeMode get themeMode;
/// Create a copy of LucyThemePreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LucyThemePreferencesCopyWith<LucyThemePreferences> get copyWith => _$LucyThemePreferencesCopyWithImpl<LucyThemePreferences>(this as LucyThemePreferences, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LucyThemePreferences&&(identical(other.interfaceStyle, interfaceStyle) || other.interfaceStyle == interfaceStyle)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,interfaceStyle,themeMode);

@override
String toString() {
  return 'LucyThemePreferences(interfaceStyle: $interfaceStyle, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $LucyThemePreferencesCopyWith<$Res>  {
  factory $LucyThemePreferencesCopyWith(LucyThemePreferences value, $Res Function(LucyThemePreferences) _then) = _$LucyThemePreferencesCopyWithImpl;
@useResult
$Res call({
 LucyInterfaceStyle interfaceStyle, ThemeMode themeMode
});




}
/// @nodoc
class _$LucyThemePreferencesCopyWithImpl<$Res>
    implements $LucyThemePreferencesCopyWith<$Res> {
  _$LucyThemePreferencesCopyWithImpl(this._self, this._then);

  final LucyThemePreferences _self;
  final $Res Function(LucyThemePreferences) _then;

/// Create a copy of LucyThemePreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interfaceStyle = null,Object? themeMode = null,}) {
  return _then(_self.copyWith(
interfaceStyle: null == interfaceStyle ? _self.interfaceStyle : interfaceStyle // ignore: cast_nullable_to_non_nullable
as LucyInterfaceStyle,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// Adds pattern-matching-related methods to [LucyThemePreferences].
extension LucyThemePreferencesPatterns on LucyThemePreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LucyThemePreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LucyThemePreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LucyThemePreferences value)  $default,){
final _that = this;
switch (_that) {
case _LucyThemePreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LucyThemePreferences value)?  $default,){
final _that = this;
switch (_that) {
case _LucyThemePreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LucyInterfaceStyle interfaceStyle,  ThemeMode themeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LucyThemePreferences() when $default != null:
return $default(_that.interfaceStyle,_that.themeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LucyInterfaceStyle interfaceStyle,  ThemeMode themeMode)  $default,) {final _that = this;
switch (_that) {
case _LucyThemePreferences():
return $default(_that.interfaceStyle,_that.themeMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LucyInterfaceStyle interfaceStyle,  ThemeMode themeMode)?  $default,) {final _that = this;
switch (_that) {
case _LucyThemePreferences() when $default != null:
return $default(_that.interfaceStyle,_that.themeMode);case _:
  return null;

}
}

}

/// @nodoc


class _LucyThemePreferences implements LucyThemePreferences {
  const _LucyThemePreferences({this.interfaceStyle = LucyInterfaceStyle.academic, this.themeMode = ThemeMode.system});
  

@override@JsonKey() final  LucyInterfaceStyle interfaceStyle;
@override@JsonKey() final  ThemeMode themeMode;

/// Create a copy of LucyThemePreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LucyThemePreferencesCopyWith<_LucyThemePreferences> get copyWith => __$LucyThemePreferencesCopyWithImpl<_LucyThemePreferences>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LucyThemePreferences&&(identical(other.interfaceStyle, interfaceStyle) || other.interfaceStyle == interfaceStyle)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}


@override
int get hashCode => Object.hash(runtimeType,interfaceStyle,themeMode);

@override
String toString() {
  return 'LucyThemePreferences(interfaceStyle: $interfaceStyle, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$LucyThemePreferencesCopyWith<$Res> implements $LucyThemePreferencesCopyWith<$Res> {
  factory _$LucyThemePreferencesCopyWith(_LucyThemePreferences value, $Res Function(_LucyThemePreferences) _then) = __$LucyThemePreferencesCopyWithImpl;
@override @useResult
$Res call({
 LucyInterfaceStyle interfaceStyle, ThemeMode themeMode
});




}
/// @nodoc
class __$LucyThemePreferencesCopyWithImpl<$Res>
    implements _$LucyThemePreferencesCopyWith<$Res> {
  __$LucyThemePreferencesCopyWithImpl(this._self, this._then);

  final _LucyThemePreferences _self;
  final $Res Function(_LucyThemePreferences) _then;

/// Create a copy of LucyThemePreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interfaceStyle = null,Object? themeMode = null,}) {
  return _then(_LucyThemePreferences(
interfaceStyle: null == interfaceStyle ? _self.interfaceStyle : interfaceStyle // ignore: cast_nullable_to_non_nullable
as LucyInterfaceStyle,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
