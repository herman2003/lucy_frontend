// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_thread_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatThreadModel {

 String get id; String get title; String get updatedAt; String? get createdAt; String? get lastMessagePreview;
/// Create a copy of ChatThreadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadModelCopyWith<ChatThreadModel> get copyWith => _$ChatThreadModelCopyWithImpl<ChatThreadModel>(this as ChatThreadModel, _$identity);

  /// Serializes this ChatThreadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,updatedAt,createdAt,lastMessagePreview);

@override
String toString() {
  return 'ChatThreadModel(id: $id, title: $title, updatedAt: $updatedAt, createdAt: $createdAt, lastMessagePreview: $lastMessagePreview)';
}


}

/// @nodoc
abstract mixin class $ChatThreadModelCopyWith<$Res>  {
  factory $ChatThreadModelCopyWith(ChatThreadModel value, $Res Function(ChatThreadModel) _then) = _$ChatThreadModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String updatedAt, String? createdAt, String? lastMessagePreview
});




}
/// @nodoc
class _$ChatThreadModelCopyWithImpl<$Res>
    implements $ChatThreadModelCopyWith<$Res> {
  _$ChatThreadModelCopyWithImpl(this._self, this._then);

  final ChatThreadModel _self;
  final $Res Function(ChatThreadModel) _then;

/// Create a copy of ChatThreadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? updatedAt = null,Object? createdAt = freezed,Object? lastMessagePreview = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatThreadModel].
extension ChatThreadModelPatterns on ChatThreadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatThreadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatThreadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatThreadModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatThreadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatThreadModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatThreadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String updatedAt,  String? createdAt,  String? lastMessagePreview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatThreadModel() when $default != null:
return $default(_that.id,_that.title,_that.updatedAt,_that.createdAt,_that.lastMessagePreview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String updatedAt,  String? createdAt,  String? lastMessagePreview)  $default,) {final _that = this;
switch (_that) {
case _ChatThreadModel():
return $default(_that.id,_that.title,_that.updatedAt,_that.createdAt,_that.lastMessagePreview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String updatedAt,  String? createdAt,  String? lastMessagePreview)?  $default,) {final _that = this;
switch (_that) {
case _ChatThreadModel() when $default != null:
return $default(_that.id,_that.title,_that.updatedAt,_that.createdAt,_that.lastMessagePreview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatThreadModel implements ChatThreadModel {
  const _ChatThreadModel({required this.id, required this.title, required this.updatedAt, this.createdAt, this.lastMessagePreview});
  factory _ChatThreadModel.fromJson(Map<String, dynamic> json) => _$ChatThreadModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String updatedAt;
@override final  String? createdAt;
@override final  String? lastMessagePreview;

/// Create a copy of ChatThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatThreadModelCopyWith<_ChatThreadModel> get copyWith => __$ChatThreadModelCopyWithImpl<_ChatThreadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatThreadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThreadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessagePreview, lastMessagePreview) || other.lastMessagePreview == lastMessagePreview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,updatedAt,createdAt,lastMessagePreview);

@override
String toString() {
  return 'ChatThreadModel(id: $id, title: $title, updatedAt: $updatedAt, createdAt: $createdAt, lastMessagePreview: $lastMessagePreview)';
}


}

/// @nodoc
abstract mixin class _$ChatThreadModelCopyWith<$Res> implements $ChatThreadModelCopyWith<$Res> {
  factory _$ChatThreadModelCopyWith(_ChatThreadModel value, $Res Function(_ChatThreadModel) _then) = __$ChatThreadModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String updatedAt, String? createdAt, String? lastMessagePreview
});




}
/// @nodoc
class __$ChatThreadModelCopyWithImpl<$Res>
    implements _$ChatThreadModelCopyWith<$Res> {
  __$ChatThreadModelCopyWithImpl(this._self, this._then);

  final _ChatThreadModel _self;
  final $Res Function(_ChatThreadModel) _then;

/// Create a copy of ChatThreadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? updatedAt = null,Object? createdAt = freezed,Object? lastMessagePreview = freezed,}) {
  return _then(_ChatThreadModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,lastMessagePreview: freezed == lastMessagePreview ? _self.lastMessagePreview : lastMessagePreview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
