// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatSourceModel {

 String get documentId; String get title; String get chunkId; String get excerpt; int? get pageStart; int? get pageEnd; double? get score;
/// Create a copy of ChatSourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSourceModelCopyWith<ChatSourceModel> get copyWith => _$ChatSourceModelCopyWithImpl<ChatSourceModel>(this as ChatSourceModel, _$identity);

  /// Serializes this ChatSourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSourceModel&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.chunkId, chunkId) || other.chunkId == chunkId)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.pageStart, pageStart) || other.pageStart == pageStart)&&(identical(other.pageEnd, pageEnd) || other.pageEnd == pageEnd)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentId,title,chunkId,excerpt,pageStart,pageEnd,score);

@override
String toString() {
  return 'ChatSourceModel(documentId: $documentId, title: $title, chunkId: $chunkId, excerpt: $excerpt, pageStart: $pageStart, pageEnd: $pageEnd, score: $score)';
}


}

/// @nodoc
abstract mixin class $ChatSourceModelCopyWith<$Res>  {
  factory $ChatSourceModelCopyWith(ChatSourceModel value, $Res Function(ChatSourceModel) _then) = _$ChatSourceModelCopyWithImpl;
@useResult
$Res call({
 String documentId, String title, String chunkId, String excerpt, int? pageStart, int? pageEnd, double? score
});




}
/// @nodoc
class _$ChatSourceModelCopyWithImpl<$Res>
    implements $ChatSourceModelCopyWith<$Res> {
  _$ChatSourceModelCopyWithImpl(this._self, this._then);

  final ChatSourceModel _self;
  final $Res Function(ChatSourceModel) _then;

/// Create a copy of ChatSourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? documentId = null,Object? title = null,Object? chunkId = null,Object? excerpt = null,Object? pageStart = freezed,Object? pageEnd = freezed,Object? score = freezed,}) {
  return _then(_self.copyWith(
documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,chunkId: null == chunkId ? _self.chunkId : chunkId // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,pageStart: freezed == pageStart ? _self.pageStart : pageStart // ignore: cast_nullable_to_non_nullable
as int?,pageEnd: freezed == pageEnd ? _self.pageEnd : pageEnd // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatSourceModel].
extension ChatSourceModelPatterns on ChatSourceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatSourceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatSourceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatSourceModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatSourceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatSourceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatSourceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String documentId,  String title,  String chunkId,  String excerpt,  int? pageStart,  int? pageEnd,  double? score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatSourceModel() when $default != null:
return $default(_that.documentId,_that.title,_that.chunkId,_that.excerpt,_that.pageStart,_that.pageEnd,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String documentId,  String title,  String chunkId,  String excerpt,  int? pageStart,  int? pageEnd,  double? score)  $default,) {final _that = this;
switch (_that) {
case _ChatSourceModel():
return $default(_that.documentId,_that.title,_that.chunkId,_that.excerpt,_that.pageStart,_that.pageEnd,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String documentId,  String title,  String chunkId,  String excerpt,  int? pageStart,  int? pageEnd,  double? score)?  $default,) {final _that = this;
switch (_that) {
case _ChatSourceModel() when $default != null:
return $default(_that.documentId,_that.title,_that.chunkId,_that.excerpt,_that.pageStart,_that.pageEnd,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatSourceModel implements ChatSourceModel {
  const _ChatSourceModel({required this.documentId, required this.title, required this.chunkId, required this.excerpt, this.pageStart, this.pageEnd, this.score});
  factory _ChatSourceModel.fromJson(Map<String, dynamic> json) => _$ChatSourceModelFromJson(json);

@override final  String documentId;
@override final  String title;
@override final  String chunkId;
@override final  String excerpt;
@override final  int? pageStart;
@override final  int? pageEnd;
@override final  double? score;

/// Create a copy of ChatSourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatSourceModelCopyWith<_ChatSourceModel> get copyWith => __$ChatSourceModelCopyWithImpl<_ChatSourceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatSourceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatSourceModel&&(identical(other.documentId, documentId) || other.documentId == documentId)&&(identical(other.title, title) || other.title == title)&&(identical(other.chunkId, chunkId) || other.chunkId == chunkId)&&(identical(other.excerpt, excerpt) || other.excerpt == excerpt)&&(identical(other.pageStart, pageStart) || other.pageStart == pageStart)&&(identical(other.pageEnd, pageEnd) || other.pageEnd == pageEnd)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,documentId,title,chunkId,excerpt,pageStart,pageEnd,score);

@override
String toString() {
  return 'ChatSourceModel(documentId: $documentId, title: $title, chunkId: $chunkId, excerpt: $excerpt, pageStart: $pageStart, pageEnd: $pageEnd, score: $score)';
}


}

/// @nodoc
abstract mixin class _$ChatSourceModelCopyWith<$Res> implements $ChatSourceModelCopyWith<$Res> {
  factory _$ChatSourceModelCopyWith(_ChatSourceModel value, $Res Function(_ChatSourceModel) _then) = __$ChatSourceModelCopyWithImpl;
@override @useResult
$Res call({
 String documentId, String title, String chunkId, String excerpt, int? pageStart, int? pageEnd, double? score
});




}
/// @nodoc
class __$ChatSourceModelCopyWithImpl<$Res>
    implements _$ChatSourceModelCopyWith<$Res> {
  __$ChatSourceModelCopyWithImpl(this._self, this._then);

  final _ChatSourceModel _self;
  final $Res Function(_ChatSourceModel) _then;

/// Create a copy of ChatSourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? documentId = null,Object? title = null,Object? chunkId = null,Object? excerpt = null,Object? pageStart = freezed,Object? pageEnd = freezed,Object? score = freezed,}) {
  return _then(_ChatSourceModel(
documentId: null == documentId ? _self.documentId : documentId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,chunkId: null == chunkId ? _self.chunkId : chunkId // ignore: cast_nullable_to_non_nullable
as String,excerpt: null == excerpt ? _self.excerpt : excerpt // ignore: cast_nullable_to_non_nullable
as String,pageStart: freezed == pageStart ? _self.pageStart : pageStart // ignore: cast_nullable_to_non_nullable
as int?,pageEnd: freezed == pageEnd ? _self.pageEnd : pageEnd // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
