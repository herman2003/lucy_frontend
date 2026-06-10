// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_eligibility_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizEligibilityModel {

 bool get canQuiz; int get activeDocumentCount;
/// Create a copy of QuizEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizEligibilityModelCopyWith<QuizEligibilityModel> get copyWith => _$QuizEligibilityModelCopyWithImpl<QuizEligibilityModel>(this as QuizEligibilityModel, _$identity);

  /// Serializes this QuizEligibilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizEligibilityModel&&(identical(other.canQuiz, canQuiz) || other.canQuiz == canQuiz)&&(identical(other.activeDocumentCount, activeDocumentCount) || other.activeDocumentCount == activeDocumentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canQuiz,activeDocumentCount);

@override
String toString() {
  return 'QuizEligibilityModel(canQuiz: $canQuiz, activeDocumentCount: $activeDocumentCount)';
}


}

/// @nodoc
abstract mixin class $QuizEligibilityModelCopyWith<$Res>  {
  factory $QuizEligibilityModelCopyWith(QuizEligibilityModel value, $Res Function(QuizEligibilityModel) _then) = _$QuizEligibilityModelCopyWithImpl;
@useResult
$Res call({
 bool canQuiz, int activeDocumentCount
});




}
/// @nodoc
class _$QuizEligibilityModelCopyWithImpl<$Res>
    implements $QuizEligibilityModelCopyWith<$Res> {
  _$QuizEligibilityModelCopyWithImpl(this._self, this._then);

  final QuizEligibilityModel _self;
  final $Res Function(QuizEligibilityModel) _then;

/// Create a copy of QuizEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canQuiz = null,Object? activeDocumentCount = null,}) {
  return _then(_self.copyWith(
canQuiz: null == canQuiz ? _self.canQuiz : canQuiz // ignore: cast_nullable_to_non_nullable
as bool,activeDocumentCount: null == activeDocumentCount ? _self.activeDocumentCount : activeDocumentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizEligibilityModel].
extension QuizEligibilityModelPatterns on QuizEligibilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizEligibilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizEligibilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizEligibilityModel value)  $default,){
final _that = this;
switch (_that) {
case _QuizEligibilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizEligibilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuizEligibilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canQuiz,  int activeDocumentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizEligibilityModel() when $default != null:
return $default(_that.canQuiz,_that.activeDocumentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canQuiz,  int activeDocumentCount)  $default,) {final _that = this;
switch (_that) {
case _QuizEligibilityModel():
return $default(_that.canQuiz,_that.activeDocumentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canQuiz,  int activeDocumentCount)?  $default,) {final _that = this;
switch (_that) {
case _QuizEligibilityModel() when $default != null:
return $default(_that.canQuiz,_that.activeDocumentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizEligibilityModel implements QuizEligibilityModel {
  const _QuizEligibilityModel({required this.canQuiz, required this.activeDocumentCount});
  factory _QuizEligibilityModel.fromJson(Map<String, dynamic> json) => _$QuizEligibilityModelFromJson(json);

@override final  bool canQuiz;
@override final  int activeDocumentCount;

/// Create a copy of QuizEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizEligibilityModelCopyWith<_QuizEligibilityModel> get copyWith => __$QuizEligibilityModelCopyWithImpl<_QuizEligibilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizEligibilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizEligibilityModel&&(identical(other.canQuiz, canQuiz) || other.canQuiz == canQuiz)&&(identical(other.activeDocumentCount, activeDocumentCount) || other.activeDocumentCount == activeDocumentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canQuiz,activeDocumentCount);

@override
String toString() {
  return 'QuizEligibilityModel(canQuiz: $canQuiz, activeDocumentCount: $activeDocumentCount)';
}


}

/// @nodoc
abstract mixin class _$QuizEligibilityModelCopyWith<$Res> implements $QuizEligibilityModelCopyWith<$Res> {
  factory _$QuizEligibilityModelCopyWith(_QuizEligibilityModel value, $Res Function(_QuizEligibilityModel) _then) = __$QuizEligibilityModelCopyWithImpl;
@override @useResult
$Res call({
 bool canQuiz, int activeDocumentCount
});




}
/// @nodoc
class __$QuizEligibilityModelCopyWithImpl<$Res>
    implements _$QuizEligibilityModelCopyWith<$Res> {
  __$QuizEligibilityModelCopyWithImpl(this._self, this._then);

  final _QuizEligibilityModel _self;
  final $Res Function(_QuizEligibilityModel) _then;

/// Create a copy of QuizEligibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canQuiz = null,Object? activeDocumentCount = null,}) {
  return _then(_QuizEligibilityModel(
canQuiz: null == canQuiz ? _self.canQuiz : canQuiz // ignore: cast_nullable_to_non_nullable
as bool,activeDocumentCount: null == activeDocumentCount ? _self.activeDocumentCount : activeDocumentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
