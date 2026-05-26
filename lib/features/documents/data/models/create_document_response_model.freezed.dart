// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_document_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateDocumentResponseModel {

 String get id; String get uploadUrl; String get expiresAt;
/// Create a copy of CreateDocumentResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDocumentResponseModelCopyWith<CreateDocumentResponseModel> get copyWith => _$CreateDocumentResponseModelCopyWithImpl<CreateDocumentResponseModel>(this as CreateDocumentResponseModel, _$identity);

  /// Serializes this CreateDocumentResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDocumentResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uploadUrl,expiresAt);

@override
String toString() {
  return 'CreateDocumentResponseModel(id: $id, uploadUrl: $uploadUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $CreateDocumentResponseModelCopyWith<$Res>  {
  factory $CreateDocumentResponseModelCopyWith(CreateDocumentResponseModel value, $Res Function(CreateDocumentResponseModel) _then) = _$CreateDocumentResponseModelCopyWithImpl;
@useResult
$Res call({
 String id, String uploadUrl, String expiresAt
});




}
/// @nodoc
class _$CreateDocumentResponseModelCopyWithImpl<$Res>
    implements $CreateDocumentResponseModelCopyWith<$Res> {
  _$CreateDocumentResponseModelCopyWithImpl(this._self, this._then);

  final CreateDocumentResponseModel _self;
  final $Res Function(CreateDocumentResponseModel) _then;

/// Create a copy of CreateDocumentResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uploadUrl = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDocumentResponseModel].
extension CreateDocumentResponseModelPatterns on CreateDocumentResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDocumentResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDocumentResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDocumentResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateDocumentResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDocumentResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDocumentResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String uploadUrl,  String expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDocumentResponseModel() when $default != null:
return $default(_that.id,_that.uploadUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String uploadUrl,  String expiresAt)  $default,) {final _that = this;
switch (_that) {
case _CreateDocumentResponseModel():
return $default(_that.id,_that.uploadUrl,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String uploadUrl,  String expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _CreateDocumentResponseModel() when $default != null:
return $default(_that.id,_that.uploadUrl,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDocumentResponseModel implements CreateDocumentResponseModel {
  const _CreateDocumentResponseModel({required this.id, required this.uploadUrl, required this.expiresAt});
  factory _CreateDocumentResponseModel.fromJson(Map<String, dynamic> json) => _$CreateDocumentResponseModelFromJson(json);

@override final  String id;
@override final  String uploadUrl;
@override final  String expiresAt;

/// Create a copy of CreateDocumentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDocumentResponseModelCopyWith<_CreateDocumentResponseModel> get copyWith => __$CreateDocumentResponseModelCopyWithImpl<_CreateDocumentResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDocumentResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDocumentResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uploadUrl, uploadUrl) || other.uploadUrl == uploadUrl)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uploadUrl,expiresAt);

@override
String toString() {
  return 'CreateDocumentResponseModel(id: $id, uploadUrl: $uploadUrl, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$CreateDocumentResponseModelCopyWith<$Res> implements $CreateDocumentResponseModelCopyWith<$Res> {
  factory _$CreateDocumentResponseModelCopyWith(_CreateDocumentResponseModel value, $Res Function(_CreateDocumentResponseModel) _then) = __$CreateDocumentResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String uploadUrl, String expiresAt
});




}
/// @nodoc
class __$CreateDocumentResponseModelCopyWithImpl<$Res>
    implements _$CreateDocumentResponseModelCopyWith<$Res> {
  __$CreateDocumentResponseModelCopyWithImpl(this._self, this._then);

  final _CreateDocumentResponseModel _self;
  final $Res Function(_CreateDocumentResponseModel) _then;

/// Create a copy of CreateDocumentResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uploadUrl = null,Object? expiresAt = null,}) {
  return _then(_CreateDocumentResponseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uploadUrl: null == uploadUrl ? _self.uploadUrl : uploadUrl // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
