// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LearningSessionModel {

 String get id; String get type; String get status; int get itemCount; String get title; String get createdAt; String get updatedAt; int get activeDocumentCount; String? get sourceChatId; List<LearningSessionItemModel> get items;
/// Create a copy of LearningSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningSessionModelCopyWith<LearningSessionModel> get copyWith => _$LearningSessionModelCopyWithImpl<LearningSessionModel>(this as LearningSessionModel, _$identity);

  /// Serializes this LearningSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.activeDocumentCount, activeDocumentCount) || other.activeDocumentCount == activeDocumentCount)&&(identical(other.sourceChatId, sourceChatId) || other.sourceChatId == sourceChatId)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,itemCount,title,createdAt,updatedAt,activeDocumentCount,sourceChatId,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'LearningSessionModel(id: $id, type: $type, status: $status, itemCount: $itemCount, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, activeDocumentCount: $activeDocumentCount, sourceChatId: $sourceChatId, items: $items)';
}


}

/// @nodoc
abstract mixin class $LearningSessionModelCopyWith<$Res>  {
  factory $LearningSessionModelCopyWith(LearningSessionModel value, $Res Function(LearningSessionModel) _then) = _$LearningSessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String type, String status, int itemCount, String title, String createdAt, String updatedAt, int activeDocumentCount, String? sourceChatId, List<LearningSessionItemModel> items
});




}
/// @nodoc
class _$LearningSessionModelCopyWithImpl<$Res>
    implements $LearningSessionModelCopyWith<$Res> {
  _$LearningSessionModelCopyWithImpl(this._self, this._then);

  final LearningSessionModel _self;
  final $Res Function(LearningSessionModel) _then;

/// Create a copy of LearningSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? status = null,Object? itemCount = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? activeDocumentCount = null,Object? sourceChatId = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,activeDocumentCount: null == activeDocumentCount ? _self.activeDocumentCount : activeDocumentCount // ignore: cast_nullable_to_non_nullable
as int,sourceChatId: freezed == sourceChatId ? _self.sourceChatId : sourceChatId // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LearningSessionItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningSessionModel].
extension LearningSessionModelPatterns on LearningSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _LearningSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _LearningSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String status,  int itemCount,  String title,  String createdAt,  String updatedAt,  int activeDocumentCount,  String? sourceChatId,  List<LearningSessionItemModel> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningSessionModel() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.itemCount,_that.title,_that.createdAt,_that.updatedAt,_that.activeDocumentCount,_that.sourceChatId,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String status,  int itemCount,  String title,  String createdAt,  String updatedAt,  int activeDocumentCount,  String? sourceChatId,  List<LearningSessionItemModel> items)  $default,) {final _that = this;
switch (_that) {
case _LearningSessionModel():
return $default(_that.id,_that.type,_that.status,_that.itemCount,_that.title,_that.createdAt,_that.updatedAt,_that.activeDocumentCount,_that.sourceChatId,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String status,  int itemCount,  String title,  String createdAt,  String updatedAt,  int activeDocumentCount,  String? sourceChatId,  List<LearningSessionItemModel> items)?  $default,) {final _that = this;
switch (_that) {
case _LearningSessionModel() when $default != null:
return $default(_that.id,_that.type,_that.status,_that.itemCount,_that.title,_that.createdAt,_that.updatedAt,_that.activeDocumentCount,_that.sourceChatId,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningSessionModel implements LearningSessionModel {
  const _LearningSessionModel({required this.id, required this.type, required this.status, required this.itemCount, required this.title, required this.createdAt, required this.updatedAt, required this.activeDocumentCount, this.sourceChatId, final  List<LearningSessionItemModel> items = const <LearningSessionItemModel>[]}): _items = items;
  factory _LearningSessionModel.fromJson(Map<String, dynamic> json) => _$LearningSessionModelFromJson(json);

@override final  String id;
@override final  String type;
@override final  String status;
@override final  int itemCount;
@override final  String title;
@override final  String createdAt;
@override final  String updatedAt;
@override final  int activeDocumentCount;
@override final  String? sourceChatId;
 final  List<LearningSessionItemModel> _items;
@override@JsonKey() List<LearningSessionItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of LearningSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningSessionModelCopyWith<_LearningSessionModel> get copyWith => __$LearningSessionModelCopyWithImpl<_LearningSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.activeDocumentCount, activeDocumentCount) || other.activeDocumentCount == activeDocumentCount)&&(identical(other.sourceChatId, sourceChatId) || other.sourceChatId == sourceChatId)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,status,itemCount,title,createdAt,updatedAt,activeDocumentCount,sourceChatId,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'LearningSessionModel(id: $id, type: $type, status: $status, itemCount: $itemCount, title: $title, createdAt: $createdAt, updatedAt: $updatedAt, activeDocumentCount: $activeDocumentCount, sourceChatId: $sourceChatId, items: $items)';
}


}

/// @nodoc
abstract mixin class _$LearningSessionModelCopyWith<$Res> implements $LearningSessionModelCopyWith<$Res> {
  factory _$LearningSessionModelCopyWith(_LearningSessionModel value, $Res Function(_LearningSessionModel) _then) = __$LearningSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String status, int itemCount, String title, String createdAt, String updatedAt, int activeDocumentCount, String? sourceChatId, List<LearningSessionItemModel> items
});




}
/// @nodoc
class __$LearningSessionModelCopyWithImpl<$Res>
    implements _$LearningSessionModelCopyWith<$Res> {
  __$LearningSessionModelCopyWithImpl(this._self, this._then);

  final _LearningSessionModel _self;
  final $Res Function(_LearningSessionModel) _then;

/// Create a copy of LearningSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? status = null,Object? itemCount = null,Object? title = null,Object? createdAt = null,Object? updatedAt = null,Object? activeDocumentCount = null,Object? sourceChatId = freezed,Object? items = null,}) {
  return _then(_LearningSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,activeDocumentCount: null == activeDocumentCount ? _self.activeDocumentCount : activeDocumentCount // ignore: cast_nullable_to_non_nullable
as int,sourceChatId: freezed == sourceChatId ? _self.sourceChatId : sourceChatId // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LearningSessionItemModel>,
  ));
}


}

// dart format on
