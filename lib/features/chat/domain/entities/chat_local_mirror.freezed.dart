// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_local_mirror.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatLocalMirror {

 List<ChatThread> get threads; Map<String, List<ChatMessage>> get messagesByChatId; String? get lastActiveChatId; Map<String, String> get composerDraftByChatId; Map<String, String> get streamDraftByChatId; String get syncedAt;
/// Create a copy of ChatLocalMirror
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatLocalMirrorCopyWith<ChatLocalMirror> get copyWith => _$ChatLocalMirrorCopyWithImpl<ChatLocalMirror>(this as ChatLocalMirror, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLocalMirror&&const DeepCollectionEquality().equals(other.threads, threads)&&const DeepCollectionEquality().equals(other.messagesByChatId, messagesByChatId)&&(identical(other.lastActiveChatId, lastActiveChatId) || other.lastActiveChatId == lastActiveChatId)&&const DeepCollectionEquality().equals(other.composerDraftByChatId, composerDraftByChatId)&&const DeepCollectionEquality().equals(other.streamDraftByChatId, streamDraftByChatId)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(threads),const DeepCollectionEquality().hash(messagesByChatId),lastActiveChatId,const DeepCollectionEquality().hash(composerDraftByChatId),const DeepCollectionEquality().hash(streamDraftByChatId),syncedAt);

@override
String toString() {
  return 'ChatLocalMirror(threads: $threads, messagesByChatId: $messagesByChatId, lastActiveChatId: $lastActiveChatId, composerDraftByChatId: $composerDraftByChatId, streamDraftByChatId: $streamDraftByChatId, syncedAt: $syncedAt)';
}


}

/// @nodoc
abstract mixin class $ChatLocalMirrorCopyWith<$Res>  {
  factory $ChatLocalMirrorCopyWith(ChatLocalMirror value, $Res Function(ChatLocalMirror) _then) = _$ChatLocalMirrorCopyWithImpl;
@useResult
$Res call({
 List<ChatThread> threads, Map<String, List<ChatMessage>> messagesByChatId, String? lastActiveChatId, Map<String, String> composerDraftByChatId, Map<String, String> streamDraftByChatId, String syncedAt
});




}
/// @nodoc
class _$ChatLocalMirrorCopyWithImpl<$Res>
    implements $ChatLocalMirrorCopyWith<$Res> {
  _$ChatLocalMirrorCopyWithImpl(this._self, this._then);

  final ChatLocalMirror _self;
  final $Res Function(ChatLocalMirror) _then;

/// Create a copy of ChatLocalMirror
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? threads = null,Object? messagesByChatId = null,Object? lastActiveChatId = freezed,Object? composerDraftByChatId = null,Object? streamDraftByChatId = null,Object? syncedAt = null,}) {
  return _then(_self.copyWith(
threads: null == threads ? _self.threads : threads // ignore: cast_nullable_to_non_nullable
as List<ChatThread>,messagesByChatId: null == messagesByChatId ? _self.messagesByChatId : messagesByChatId // ignore: cast_nullable_to_non_nullable
as Map<String, List<ChatMessage>>,lastActiveChatId: freezed == lastActiveChatId ? _self.lastActiveChatId : lastActiveChatId // ignore: cast_nullable_to_non_nullable
as String?,composerDraftByChatId: null == composerDraftByChatId ? _self.composerDraftByChatId : composerDraftByChatId // ignore: cast_nullable_to_non_nullable
as Map<String, String>,streamDraftByChatId: null == streamDraftByChatId ? _self.streamDraftByChatId : streamDraftByChatId // ignore: cast_nullable_to_non_nullable
as Map<String, String>,syncedAt: null == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatLocalMirror].
extension ChatLocalMirrorPatterns on ChatLocalMirror {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatLocalMirror value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatLocalMirror() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatLocalMirror value)  $default,){
final _that = this;
switch (_that) {
case _ChatLocalMirror():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatLocalMirror value)?  $default,){
final _that = this;
switch (_that) {
case _ChatLocalMirror() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatThread> threads,  Map<String, List<ChatMessage>> messagesByChatId,  String? lastActiveChatId,  Map<String, String> composerDraftByChatId,  Map<String, String> streamDraftByChatId,  String syncedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatLocalMirror() when $default != null:
return $default(_that.threads,_that.messagesByChatId,_that.lastActiveChatId,_that.composerDraftByChatId,_that.streamDraftByChatId,_that.syncedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatThread> threads,  Map<String, List<ChatMessage>> messagesByChatId,  String? lastActiveChatId,  Map<String, String> composerDraftByChatId,  Map<String, String> streamDraftByChatId,  String syncedAt)  $default,) {final _that = this;
switch (_that) {
case _ChatLocalMirror():
return $default(_that.threads,_that.messagesByChatId,_that.lastActiveChatId,_that.composerDraftByChatId,_that.streamDraftByChatId,_that.syncedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatThread> threads,  Map<String, List<ChatMessage>> messagesByChatId,  String? lastActiveChatId,  Map<String, String> composerDraftByChatId,  Map<String, String> streamDraftByChatId,  String syncedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatLocalMirror() when $default != null:
return $default(_that.threads,_that.messagesByChatId,_that.lastActiveChatId,_that.composerDraftByChatId,_that.streamDraftByChatId,_that.syncedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ChatLocalMirror implements ChatLocalMirror {
  const _ChatLocalMirror({final  List<ChatThread> threads = const <ChatThread>[], final  Map<String, List<ChatMessage>> messagesByChatId = const <String, List<ChatMessage>>{}, this.lastActiveChatId, final  Map<String, String> composerDraftByChatId = const <String, String>{}, final  Map<String, String> streamDraftByChatId = const <String, String>{}, this.syncedAt = ''}): _threads = threads,_messagesByChatId = messagesByChatId,_composerDraftByChatId = composerDraftByChatId,_streamDraftByChatId = streamDraftByChatId;
  

 final  List<ChatThread> _threads;
@override@JsonKey() List<ChatThread> get threads {
  if (_threads is EqualUnmodifiableListView) return _threads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_threads);
}

 final  Map<String, List<ChatMessage>> _messagesByChatId;
@override@JsonKey() Map<String, List<ChatMessage>> get messagesByChatId {
  if (_messagesByChatId is EqualUnmodifiableMapView) return _messagesByChatId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_messagesByChatId);
}

@override final  String? lastActiveChatId;
 final  Map<String, String> _composerDraftByChatId;
@override@JsonKey() Map<String, String> get composerDraftByChatId {
  if (_composerDraftByChatId is EqualUnmodifiableMapView) return _composerDraftByChatId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_composerDraftByChatId);
}

 final  Map<String, String> _streamDraftByChatId;
@override@JsonKey() Map<String, String> get streamDraftByChatId {
  if (_streamDraftByChatId is EqualUnmodifiableMapView) return _streamDraftByChatId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_streamDraftByChatId);
}

@override@JsonKey() final  String syncedAt;

/// Create a copy of ChatLocalMirror
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatLocalMirrorCopyWith<_ChatLocalMirror> get copyWith => __$ChatLocalMirrorCopyWithImpl<_ChatLocalMirror>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatLocalMirror&&const DeepCollectionEquality().equals(other._threads, _threads)&&const DeepCollectionEquality().equals(other._messagesByChatId, _messagesByChatId)&&(identical(other.lastActiveChatId, lastActiveChatId) || other.lastActiveChatId == lastActiveChatId)&&const DeepCollectionEquality().equals(other._composerDraftByChatId, _composerDraftByChatId)&&const DeepCollectionEquality().equals(other._streamDraftByChatId, _streamDraftByChatId)&&(identical(other.syncedAt, syncedAt) || other.syncedAt == syncedAt));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_threads),const DeepCollectionEquality().hash(_messagesByChatId),lastActiveChatId,const DeepCollectionEquality().hash(_composerDraftByChatId),const DeepCollectionEquality().hash(_streamDraftByChatId),syncedAt);

@override
String toString() {
  return 'ChatLocalMirror(threads: $threads, messagesByChatId: $messagesByChatId, lastActiveChatId: $lastActiveChatId, composerDraftByChatId: $composerDraftByChatId, streamDraftByChatId: $streamDraftByChatId, syncedAt: $syncedAt)';
}


}

/// @nodoc
abstract mixin class _$ChatLocalMirrorCopyWith<$Res> implements $ChatLocalMirrorCopyWith<$Res> {
  factory _$ChatLocalMirrorCopyWith(_ChatLocalMirror value, $Res Function(_ChatLocalMirror) _then) = __$ChatLocalMirrorCopyWithImpl;
@override @useResult
$Res call({
 List<ChatThread> threads, Map<String, List<ChatMessage>> messagesByChatId, String? lastActiveChatId, Map<String, String> composerDraftByChatId, Map<String, String> streamDraftByChatId, String syncedAt
});




}
/// @nodoc
class __$ChatLocalMirrorCopyWithImpl<$Res>
    implements _$ChatLocalMirrorCopyWith<$Res> {
  __$ChatLocalMirrorCopyWithImpl(this._self, this._then);

  final _ChatLocalMirror _self;
  final $Res Function(_ChatLocalMirror) _then;

/// Create a copy of ChatLocalMirror
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? threads = null,Object? messagesByChatId = null,Object? lastActiveChatId = freezed,Object? composerDraftByChatId = null,Object? streamDraftByChatId = null,Object? syncedAt = null,}) {
  return _then(_ChatLocalMirror(
threads: null == threads ? _self._threads : threads // ignore: cast_nullable_to_non_nullable
as List<ChatThread>,messagesByChatId: null == messagesByChatId ? _self._messagesByChatId : messagesByChatId // ignore: cast_nullable_to_non_nullable
as Map<String, List<ChatMessage>>,lastActiveChatId: freezed == lastActiveChatId ? _self.lastActiveChatId : lastActiveChatId // ignore: cast_nullable_to_non_nullable
as String?,composerDraftByChatId: null == composerDraftByChatId ? _self._composerDraftByChatId : composerDraftByChatId // ignore: cast_nullable_to_non_nullable
as Map<String, String>,streamDraftByChatId: null == streamDraftByChatId ? _self._streamDraftByChatId : streamDraftByChatId // ignore: cast_nullable_to_non_nullable
as Map<String, String>,syncedAt: null == syncedAt ? _self.syncedAt : syncedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
