// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_threads_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatThreadsState {

 bool get isLoading; List<ChatThread> get threads; String? get selectedChatId; ChatEligibility? get eligibility; String? get errorCode;
/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatThreadsStateCopyWith<ChatThreadsState> get copyWith => _$ChatThreadsStateCopyWithImpl<ChatThreadsState>(this as ChatThreadsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatThreadsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.threads, threads)&&(identical(other.selectedChatId, selectedChatId) || other.selectedChatId == selectedChatId)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(threads),selectedChatId,eligibility,errorCode);

@override
String toString() {
  return 'ChatThreadsState(isLoading: $isLoading, threads: $threads, selectedChatId: $selectedChatId, eligibility: $eligibility, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class $ChatThreadsStateCopyWith<$Res>  {
  factory $ChatThreadsStateCopyWith(ChatThreadsState value, $Res Function(ChatThreadsState) _then) = _$ChatThreadsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<ChatThread> threads, String? selectedChatId, ChatEligibility? eligibility, String? errorCode
});




}
/// @nodoc
class _$ChatThreadsStateCopyWithImpl<$Res>
    implements $ChatThreadsStateCopyWith<$Res> {
  _$ChatThreadsStateCopyWithImpl(this._self, this._then);

  final ChatThreadsState _self;
  final $Res Function(ChatThreadsState) _then;

/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? threads = null,Object? selectedChatId = freezed,Object? eligibility = freezed,Object? errorCode = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,threads: null == threads ? _self.threads : threads // ignore: cast_nullable_to_non_nullable
as List<ChatThread>,selectedChatId: freezed == selectedChatId ? _self.selectedChatId : selectedChatId // ignore: cast_nullable_to_non_nullable
as String?,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as ChatEligibility?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatThreadsState].
extension ChatThreadsStatePatterns on ChatThreadsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatThreadsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatThreadsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatThreadsState value)  $default,){
final _that = this;
switch (_that) {
case _ChatThreadsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatThreadsState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatThreadsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<ChatThread> threads,  String? selectedChatId,  ChatEligibility? eligibility,  String? errorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatThreadsState() when $default != null:
return $default(_that.isLoading,_that.threads,_that.selectedChatId,_that.eligibility,_that.errorCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<ChatThread> threads,  String? selectedChatId,  ChatEligibility? eligibility,  String? errorCode)  $default,) {final _that = this;
switch (_that) {
case _ChatThreadsState():
return $default(_that.isLoading,_that.threads,_that.selectedChatId,_that.eligibility,_that.errorCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<ChatThread> threads,  String? selectedChatId,  ChatEligibility? eligibility,  String? errorCode)?  $default,) {final _that = this;
switch (_that) {
case _ChatThreadsState() when $default != null:
return $default(_that.isLoading,_that.threads,_that.selectedChatId,_that.eligibility,_that.errorCode);case _:
  return null;

}
}

}

/// @nodoc


class _ChatThreadsState implements ChatThreadsState {
  const _ChatThreadsState({this.isLoading = false, final  List<ChatThread> threads = const <ChatThread>[], this.selectedChatId, this.eligibility, this.errorCode}): _threads = threads;
  

@override@JsonKey() final  bool isLoading;
 final  List<ChatThread> _threads;
@override@JsonKey() List<ChatThread> get threads {
  if (_threads is EqualUnmodifiableListView) return _threads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_threads);
}

@override final  String? selectedChatId;
@override final  ChatEligibility? eligibility;
@override final  String? errorCode;

/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatThreadsStateCopyWith<_ChatThreadsState> get copyWith => __$ChatThreadsStateCopyWithImpl<_ChatThreadsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatThreadsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._threads, _threads)&&(identical(other.selectedChatId, selectedChatId) || other.selectedChatId == selectedChatId)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.errorCode, errorCode) || other.errorCode == errorCode));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_threads),selectedChatId,eligibility,errorCode);

@override
String toString() {
  return 'ChatThreadsState(isLoading: $isLoading, threads: $threads, selectedChatId: $selectedChatId, eligibility: $eligibility, errorCode: $errorCode)';
}


}

/// @nodoc
abstract mixin class _$ChatThreadsStateCopyWith<$Res> implements $ChatThreadsStateCopyWith<$Res> {
  factory _$ChatThreadsStateCopyWith(_ChatThreadsState value, $Res Function(_ChatThreadsState) _then) = __$ChatThreadsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<ChatThread> threads, String? selectedChatId, ChatEligibility? eligibility, String? errorCode
});




}
/// @nodoc
class __$ChatThreadsStateCopyWithImpl<$Res>
    implements _$ChatThreadsStateCopyWith<$Res> {
  __$ChatThreadsStateCopyWithImpl(this._self, this._then);

  final _ChatThreadsState _self;
  final $Res Function(_ChatThreadsState) _then;

/// Create a copy of ChatThreadsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? threads = null,Object? selectedChatId = freezed,Object? eligibility = freezed,Object? errorCode = freezed,}) {
  return _then(_ChatThreadsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,threads: null == threads ? _self._threads : threads // ignore: cast_nullable_to_non_nullable
as List<ChatThread>,selectedChatId: freezed == selectedChatId ? _self.selectedChatId : selectedChatId // ignore: cast_nullable_to_non_nullable
as String?,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as ChatEligibility?,errorCode: freezed == errorCode ? _self.errorCode : errorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
