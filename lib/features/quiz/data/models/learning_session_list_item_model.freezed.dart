// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_session_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningSessionListItemModel {

 String get id; String get type; String get status; int get itemCount; String get title; String get createdAt; String get updatedAt;
/// Create a copy of LearningSessionListItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningSessionListItemModelCopyWith<LearningSessionListItemModel> get copyWith => _$LearningSessionListItemModelCopyWithImpl<LearningSessionListItemModel>(this as LearningSessionListItemModel, _$identity);

  /// Serializes this LearningSessionListItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningSessionListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,itemCount,title,createdAt,updatedAt);

@override
String toString() {
  return 'LearningSessionListItemModel(id: $id, type: $type, status: $status, itemCount: $itemCount, title: $title, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LearningSessionListItemModelCopyWith<$Res>  {
  factory $LearningSessionListItemModelCopyWith(LearningSessionListItemModel value, $Res Function(LearningSessionListItemModel) _then) = _$LearningSessionListItemModelCopyWithImpl;
@useResult
$Res call({
 String id, String type, String status, int itemCount, String title, String createdAt, String updatedAt
});




}
/// @nodoc
class _$LearningSessionListItemModelCopyWithImpl<$Res>
    implements $LearningSessionListItemModelCopyWith<$Res> {
  _$LearningSessionListItemModelCopyWithImpl(this._self, this._then);

  final LearningSessionListItemModel _self;
  final $Res Function(LearningSessionListItemModel) _then;

/// Create a copy of LearningSessionListItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? itemCount = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningSessionListItemModel].
extension LearningSessionListItemModelPatterns on LearningSessionListItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningSessionListItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningSessionListItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningSessionListItemModel value)  $default,){
final _that = this;
switch (_that) {
case _LearningSessionListItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningSessionListItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _LearningSessionListItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String status,  int itemCount,  String title,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningSessionListItemModel() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.itemCount,_that.title,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String status,  int itemCount,  String title,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LearningSessionListItemModel():
return $default(_that.id,_that.type,_that.status,_that.itemCount,_that.title,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String status,  int itemCount,  String title,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LearningSessionListItemModel() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.itemCount,_that.title,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningSessionListItemModel implements LearningSessionListItemModel {
  const _LearningSessionListItemModel({required this.id, required this.type, required this.status, required this.itemCount, required this.title, required this.createdAt, required this.updatedAt});
  factory _LearningSessionListItemModel.fromJson(Map<String, dynamic> json) => _$LearningSessionListItemModelFromJson(json);

@override final  String id;
@override final  String type;
@override final  String status;
@override final  int itemCount;
@override final  String title;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of LearningSessionListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningSessionListItemModelCopyWith<_LearningSessionListItemModel> get copyWith => __$LearningSessionListItemModelCopyWithImpl<_LearningSessionListItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningSessionListItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningSessionListItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,itemCount,title,createdAt,updatedAt);

@override
String toString() {
  return 'LearningSessionListItemModel(id: $id, type: $type, status: $status, itemCount: $itemCount, title: $title, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LearningSessionListItemModelCopyWith<$Res> implements $LearningSessionListItemModelCopyWith<$Res> {
  factory _$LearningSessionListItemModelCopyWith(_LearningSessionListItemModel value, $Res Function(_LearningSessionListItemModel) _then) = __$LearningSessionListItemModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String status, int itemCount, String title, String createdAt, String updatedAt
});




}
/// @nodoc
class __$LearningSessionListItemModelCopyWithImpl<$Res>
    implements _$LearningSessionListItemModelCopyWith<$Res> {
  __$LearningSessionListItemModelCopyWithImpl(this._self, this._then);

  final _LearningSessionListItemModel _self;
  final $Res Function(_LearningSessionListItemModel) _then;

/// Create a copy of LearningSessionListItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? itemCount = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_LearningSessionListItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
