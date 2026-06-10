// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_conversation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatConversationState {

 bool get isLoadingMessages; List<ChatMessage> get messages; ChatSendPhase get sendPhase; String get streamingContent; List<ChatSource> get pendingSources; String? get errorCode;
/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatConversationStateCopyWith<ChatConversationState> get copyWith => _$ChatConversationStateCopyWithImpl<ChatConversationState>(this as ChatConversationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConversationState&&(identical(other.isLoadingMessages, isLoadingMessages) || other.isLoadingMessages == isLoadingMessages)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.sendPhase, sendPhase) || other.sendPhase == sendPhase)&&(identical(other.streamingContent, streamingContent) || other.streamingContent == streamingContent)&&const DeepCollectionEquality().equals(other.pendingSources, pendingSources)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingMessages,const DeepCollectionEquality().hash(messages),sendPhase,streamingContent,const DeepCollectionEquality().hash(pendingSources),errorCode);

@override
String toString() {
  return 'ChatConversationState(isLoadingMessages: $isLoadingMessages, messages: $messages, sendPhase: $sendPhase, streamingContent: $streamingContent, pendingSources: $pendingSources, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $ChatConversationStateCopyWith<$Res>  {
  factory $ChatConversationStateCopyWith(ChatConversationState value, $Res Function(ChatConversationState) _then) = _$ChatConversationStateCopyWithImpl;
@useResult
$Res call({
 bool isLoadingMessages, List<ChatMessage> messages, ChatSendPhase sendPhase, String streamingContent, List<ChatSource> pendingSources, String? errorCode
});




}
/// @nodoc
class _$ChatConversationStateCopyWithImpl<$Res>
    implements $ChatConversationStateCopyWith<$Res> {
  _$ChatConversationStateCopyWithImpl(this._self, this._then);

  final ChatConversationState _self;
  final $Res Function(ChatConversationState) _then;

/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoadingMessages = null,Object? messages = null,Object? sendPhase = null,Object? streamingContent = null,Object? pendingSources = null,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
isLoadingMessages: null == isLoadingMessages ? _self.isLoadingMessages : isLoadingMessages // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,sendPhase: null == sendPhase ? _self.sendPhase : sendPhase // ignore: cast_nullable_to_non_nullable
as ChatSendPhase,streamingContent: null == streamingContent ? _self.streamingContent : streamingContent // ignore: cast_nullable_to_non_nullable
as String,pendingSources: null == pendingSources ? _self.pendingSources : pendingSources // ignore: cast_nullable_to_non_nullable
as List<ChatSource>,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatConversationState].
extension ChatConversationStatePatterns on ChatConversationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatConversationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConversationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatConversationState value)  $default,){
final _that = this;
switch (_that) {
case _ChatConversationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatConversationState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatConversationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoadingMessages,  List<ChatMessage> messages,  ChatSendPhase sendPhase,  String streamingContent,  List<ChatSource> pendingSources,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConversationState() when $default != null:
return $default(_that.isLoadingMessages,_that.messages,_that.sendPhase,_that.streamingContent,_that.pendingSources,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoadingMessages,  List<ChatMessage> messages,  ChatSendPhase sendPhase,  String streamingContent,  List<ChatSource> pendingSources,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _ChatConversationState():
return $default(_that.isLoadingMessages,_that.messages,_that.sendPhase,_that.streamingContent,_that.pendingSources,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoadingMessages,  List<ChatMessage> messages,  ChatSendPhase sendPhase,  String streamingContent,  List<ChatSource> pendingSources,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _ChatConversationState() when $default != null:
return $default(_that.isLoadingMessages,_that.messages,_that.sendPhase,_that.streamingContent,_that.pendingSources,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _ChatConversationState extends ChatConversationState {
  const _ChatConversationState({this.isLoadingMessages = false, final  List<ChatMessage> messages = const <ChatMessage>[], this.sendPhase = ChatSendPhase.idle, this.streamingContent = '', final  List<ChatSource> pendingSources = const <ChatSource>[], this.errorCode}): _messages = messages,_pendingSources = pendingSources,super._();
  

@override@JsonKey() final  bool isLoadingMessages;
 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  ChatSendPhase sendPhase;
@override@JsonKey() final  String streamingContent;
 final  List<ChatSource> _pendingSources;
@override@JsonKey() List<ChatSource> get pendingSources {
  if (_pendingSources is EqualUnmodifiableListView) return _pendingSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingSources);
}

@override final  String? errorCode;

/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConversationStateCopyWith<_ChatConversationState> get copyWith => __$ChatConversationStateCopyWithImpl<_ChatConversationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConversationState&&(identical(other.isLoadingMessages, isLoadingMessages) || other.isLoadingMessages == isLoadingMessages)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.sendPhase, sendPhase) || other.sendPhase == sendPhase)&&(identical(other.streamingContent, streamingContent) || other.streamingContent == streamingContent)&&const DeepCollectionEquality().equals(other._pendingSources, _pendingSources)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingMessages,const DeepCollectionEquality().hash(_messages),sendPhase,streamingContent,const DeepCollectionEquality().hash(_pendingSources),errorCode);

@override
String toString() {
  return 'ChatConversationState(isLoadingMessages: $isLoadingMessages, messages: $messages, sendPhase: $sendPhase, streamingContent: $streamingContent, pendingSources: $pendingSources, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$ChatConversationStateCopyWith<$Res> implements $ChatConversationStateCopyWith<$Res> {
  factory _$ChatConversationStateCopyWith(_ChatConversationState value, $Res Function(_ChatConversationState) _then) = __$ChatConversationStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoadingMessages, List<ChatMessage> messages, ChatSendPhase sendPhase, String streamingContent, List<ChatSource> pendingSources, String? errorCode
});




}
/// @nodoc
class __$ChatConversationStateCopyWithImpl<$Res>
    implements _$ChatConversationStateCopyWith<$Res> {
  __$ChatConversationStateCopyWithImpl(this._self, this._then);

  final _ChatConversationState _self;
  final $Res Function(_ChatConversationState) _then;

/// Create a copy of ChatConversationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoadingMessages = null,Object? messages = null,Object? sendPhase = null,Object? streamingContent = null,Object? pendingSources = null,Object? errorCode = freezed,}) {
  return _then(_ChatConversationState(
isLoadingMessages: null == isLoadingMessages ? _self.isLoadingMessages : isLoadingMessages // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,sendPhase: null == sendPhase ? _self.sendPhase : sendPhase // ignore: cast_nullable_to_non_nullable
as ChatSendPhase,streamingContent: null == streamingContent ? _self.streamingContent : streamingContent // ignore: cast_nullable_to_non_nullable
as String,pendingSources: null == pendingSources ? _self._pendingSources : pendingSources // ignore: cast_nullable_to_non_nullable
as List<ChatSource>,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
