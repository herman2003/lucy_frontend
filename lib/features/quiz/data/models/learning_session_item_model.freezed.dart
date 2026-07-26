// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_session_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningSessionItemModel {

 String get id; List<LearningSessionSourceModel> get sources; String? get question; List<String>? get choices; int? get correctIndex; String? get explanation; String? get front; String? get back;
/// Create a copy of LearningSessionItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningSessionItemModelCopyWith<LearningSessionItemModel> get copyWith => _$LearningSessionItemModelCopyWithImpl<LearningSessionItemModel>(this as LearningSessionItemModel, _$identity);

  /// Serializes this LearningSessionItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningSessionItemModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.sources, sources)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.front, front) || other.front == front)&&(identical(other.back, back) || other.back == back));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(sources),question,const DeepCollectionEquality().hash(choices),correctIndex,explanation,front,back);

@override
String toString() {
  return 'LearningSessionItemModel(id: $id, sources: $sources, question: $question, choices: $choices, correctIndex: $correctIndex, explanation: $explanation, front: $front, back: $back)';
}


}

/// @nodoc
abstract mixin class $LearningSessionItemModelCopyWith<$Res>  {
  factory $LearningSessionItemModelCopyWith(LearningSessionItemModel value, $Res Function(LearningSessionItemModel) _then) = _$LearningSessionItemModelCopyWithImpl;
@useResult
$Res call({
 String id, List<LearningSessionSourceModel> sources, String? question, List<String>? choices, int? correctIndex, String? explanation, String? front, String? back
});




}
/// @nodoc
class _$LearningSessionItemModelCopyWithImpl<$Res>
    implements $LearningSessionItemModelCopyWith<$Res> {
  _$LearningSessionItemModelCopyWithImpl(this._self, this._then);

  final LearningSessionItemModel _self;
  final $Res Function(LearningSessionItemModel) _then;

/// Create a copy of LearningSessionItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sources = null,Object? question = freezed,Object? choices = freezed,Object? correctIndex = freezed,Object? explanation = freezed,Object? front = freezed,Object? back = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self.sources : sources // ignore: cast_nullable_to_non_nullable
as List<LearningSessionSourceModel>,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,choices: freezed == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,correctIndex: freezed == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,front: freezed == front ? _self.front : front // ignore: cast_nullable_to_non_nullable
as String?,back: freezed == back ? _self.back : back // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningSessionItemModel].
extension LearningSessionItemModelPatterns on LearningSessionItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningSessionItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningSessionItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningSessionItemModel value)  $default,){
final _that = this;
switch (_that) {
case _LearningSessionItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningSessionItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _LearningSessionItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<LearningSessionSourceModel> sources,  String? question,  List<String>? choices,  int? correctIndex,  String? explanation,  String? front,  String? back)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningSessionItemModel() when $default != null:
return $default(_that.id,_that.sources,_that.question,_that.choices,_that.correctIndex,_that.explanation,_that.front,_that.back);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<LearningSessionSourceModel> sources,  String? question,  List<String>? choices,  int? correctIndex,  String? explanation,  String? front,  String? back)  $default,) {final _that = this;
switch (_that) {
case _LearningSessionItemModel():
return $default(_that.id,_that.sources,_that.question,_that.choices,_that.correctIndex,_that.explanation,_that.front,_that.back);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<LearningSessionSourceModel> sources,  String? question,  List<String>? choices,  int? correctIndex,  String? explanation,  String? front,  String? back)?  $default,) {final _that = this;
switch (_that) {
case _LearningSessionItemModel() when $default != null:
return $default(_that.id,_that.sources,_that.question,_that.choices,_that.correctIndex,_that.explanation,_that.front,_that.back);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningSessionItemModel implements LearningSessionItemModel {
  const _LearningSessionItemModel({required this.id, final  List<LearningSessionSourceModel> sources = const <LearningSessionSourceModel>[], this.question, final  List<String>? choices, this.correctIndex, this.explanation, this.front, this.back}): _sources = sources,_choices = choices;
  factory _LearningSessionItemModel.fromJson(Map<String, dynamic> json) => _$LearningSessionItemModelFromJson(json);

@override final  String id;
 final  List<LearningSessionSourceModel> _sources;
@override@JsonKey() List<LearningSessionSourceModel> get sources {
  if (_sources is EqualUnmodifiableListView) return _sources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sources);
}

@override final  String? question;
 final  List<String>? _choices;
@override List<String>? get choices {
  final value = _choices;
  if (value == null) return null;
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? correctIndex;
@override final  String? explanation;
@override final  String? front;
@override final  String? back;

/// Create a copy of LearningSessionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningSessionItemModelCopyWith<_LearningSessionItemModel> get copyWith => __$LearningSessionItemModelCopyWithImpl<_LearningSessionItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningSessionItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningSessionItemModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._sources, _sources)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.front, front) || other.front == front)&&(identical(other.back, back) || other.back == back));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_sources),question,const DeepCollectionEquality().hash(_choices),correctIndex,explanation,front,back);

@override
String toString() {
  return 'LearningSessionItemModel(id: $id, sources: $sources, question: $question, choices: $choices, correctIndex: $correctIndex, explanation: $explanation, front: $front, back: $back)';
}


}

/// @nodoc
abstract mixin class _$LearningSessionItemModelCopyWith<$Res> implements $LearningSessionItemModelCopyWith<$Res> {
  factory _$LearningSessionItemModelCopyWith(_LearningSessionItemModel value, $Res Function(_LearningSessionItemModel) _then) = __$LearningSessionItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, List<LearningSessionSourceModel> sources, String? question, List<String>? choices, int? correctIndex, String? explanation, String? front, String? back
});




}
/// @nodoc
class __$LearningSessionItemModelCopyWithImpl<$Res>
    implements _$LearningSessionItemModelCopyWith<$Res> {
  __$LearningSessionItemModelCopyWithImpl(this._self, this._then);

  final _LearningSessionItemModel _self;
  final $Res Function(_LearningSessionItemModel) _then;

/// Create a copy of LearningSessionItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sources = null,Object? question = freezed,Object? choices = freezed,Object? correctIndex = freezed,Object? explanation = freezed,Object? front = freezed,Object? back = freezed,}) {
  return _then(_LearningSessionItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sources: null == sources ? _self._sources : sources // ignore: cast_nullable_to_non_nullable
as List<LearningSessionSourceModel>,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String?,choices: freezed == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,correctIndex: freezed == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,front: freezed == front ? _self.front : front // ignore: cast_nullable_to_non_nullable
as String?,back: freezed == back ? _self.back : back // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
