// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_session_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningSessionSourceModel {

 String get chunkId; String get documentId; String get title; String get excerpt; int? get pageStart; int? get pageEnd;
/// Create a copy of LearningSessionSourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningSessionSourceModelCopyWith<LearningSessionSourceModel> get copyWith => _$LearningSessionSourceModelCopyWithImpl<LearningSessionSourceModel>(this as LearningSessionSourceModel, _$identity);

  /// Serializes this LearningSessionSourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningSessionSourceModel&&(identical(other.chunkId, chunkId) || other.chunkId == chunkId)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.pageStart, pageStart) || other.pageStart == pageStart)&&(identical(other.pageEnd, pageEnd) || other.pageEnd == pageEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chunkId,documentId,title,excerpt,pageStart,pageEnd);

@override
String toString() {
  return 'LearningSessionSourceModel(chunkId: $chunkId, documentId: $documentId, title: $title, excerpt: $excerpt, pageStart: $pageStart, pageEnd: $pageEnd)';
}


}

/// @nodoc
abstract mixin class $LearningSessionSourceModelCopyWith<$Res>  {
  factory $LearningSessionSourceModelCopyWith(LearningSessionSourceModel value, $Res Function(LearningSessionSourceModel) _then) = _$LearningSessionSourceModelCopyWithImpl;
@useResult
$Res call({
 String chunkId, String documentId, String title, String excerpt, int? pageStart, int? pageEnd
});




}
/// @nodoc
class _$LearningSessionSourceModelCopyWithImpl<$Res>
    implements $LearningSessionSourceModelCopyWith<$Res> {
  _$LearningSessionSourceModelCopyWithImpl(this._self, this._then);

  final LearningSessionSourceModel _self;
  final $Res Function(LearningSessionSourceModel) _then;

/// Create a copy of LearningSessionSourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chunkId = null,Object? documentId = null,Object? title = null,Object? excerpt = null,Object? pageStart = freezed,Object? pageEnd = freezed,}) {
  return _then(_self.copyWith(
chunkId: null == chunkId ? _self.chunkId : chunkId // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,pageStart: freezed == pageStart ? _self.pageStart : pageStart // ignore: cast_nullable_to_non_nullable
as int?,pageEnd: freezed == pageEnd ? _self.pageEnd : pageEnd // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningSessionSourceModel].
extension LearningSessionSourceModelPatterns on LearningSessionSourceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningSessionSourceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningSessionSourceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningSessionSourceModel value)  $default,){
final _that = this;
switch (_that) {
case _LearningSessionSourceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningSessionSourceModel value)?  $default,){
final _that = this;
switch (_that) {
case _LearningSessionSourceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chunkId,  String documentId,  String title,  String excerpt,  int? pageStart,  int? pageEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningSessionSourceModel() when $default != null:
return $default(_that.chunkId,_that.documentId,_that.title,_that.excerpt,_that.pageStart,_that.pageEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chunkId,  String documentId,  String title,  String excerpt,  int? pageStart,  int? pageEnd)  $default,) {final _that = this;
switch (_that) {
case _LearningSessionSourceModel():
return $default(_that.chunkId,_that.documentId,_that.title,_that.excerpt,_that.pageStart,_that.pageEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chunkId,  String documentId,  String title,  String excerpt,  int? pageStart,  int? pageEnd)?  $default,) {final _that = this;
switch (_that) {
case _LearningSessionSourceModel() when $default != null:
return $default(_that.chunkId,_that.documentId,_that.title,_that.excerpt,_that.pageStart,_that.pageEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningSessionSourceModel implements LearningSessionSourceModel {
  const _LearningSessionSourceModel({required this.chunkId, required this.documentId, required this.title, required this.excerpt, this.pageStart, this.pageEnd});
  factory _LearningSessionSourceModel.fromJson(Map<String, dynamic> json) => _$LearningSessionSourceModelFromJson(json);

@override final  String chunkId;
@override final  String documentId;
@override final  String title;
@override final  String excerpt;
@override final  int? pageStart;
@override final  int? pageEnd;

/// Create a copy of LearningSessionSourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningSessionSourceModelCopyWith<_LearningSessionSourceModel> get copyWith => __$LearningSessionSourceModelCopyWithImpl<_LearningSessionSourceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningSessionSourceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningSessionSourceModel&&(identical(other.chunkId, chunkId) || other.chunkId == chunkId)&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.pageStart, pageStart) || other.pageStart == pageStart)&&(identical(other.pageEnd, pageEnd) || other.pageEnd == pageEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chunkId,documentId,title,excerpt,pageStart,pageEnd);

@override
String toString() {
  return 'LearningSessionSourceModel(chunkId: $chunkId, documentId: $documentId, title: $title, excerpt: $excerpt, pageStart: $pageStart, pageEnd: $pageEnd)';
}


}

/// @nodoc
abstract mixin class _$LearningSessionSourceModelCopyWith<$Res> implements $LearningSessionSourceModelCopyWith<$Res> {
  factory _$LearningSessionSourceModelCopyWith(_LearningSessionSourceModel value, $Res Function(_LearningSessionSourceModel) _then) = __$LearningSessionSourceModelCopyWithImpl;
@override @useResult
$Res call({
 String chunkId, String documentId, String title, String excerpt, int? pageStart, int? pageEnd
});




}
/// @nodoc
class __$LearningSessionSourceModelCopyWithImpl<$Res>
    implements _$LearningSessionSourceModelCopyWith<$Res> {
  __$LearningSessionSourceModelCopyWithImpl(this._self, this._then);

  final _LearningSessionSourceModel _self;
  final $Res Function(_LearningSessionSourceModel) _then;

/// Create a copy of LearningSessionSourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chunkId = null,Object? documentId = null,Object? title = null,Object? excerpt = null,Object? pageStart = freezed,Object? pageEnd = freezed,}) {
  return _then(_LearningSessionSourceModel(
chunkId: null == chunkId ? _self.chunkId : chunkId // ignore: cast_nullable_to_non_nullable
as String,documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,pageStart: freezed == pageStart ? _self.pageStart : pageStart // ignore: cast_nullable_to_non_nullable
as int?,pageEnd: freezed == pageEnd ? _self.pageEnd : pageEnd // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
