// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InspectorConfig implements DiagnosticableTreeMixin {

/// Maximum number of logs to keep in memory
 int get maxLogs;/// Maximum body size to log (in bytes). Set to null for unlimited.
 int? get maxBodySize;// 1MB default
 bool get isActive;
/// Create a copy of InspectorConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectorConfigCopyWith<InspectorConfig> get copyWith => _$InspectorConfigCopyWithImpl<InspectorConfig>(this as InspectorConfig, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'InspectorConfig'))
    ..add(DiagnosticsProperty('maxLogs', maxLogs))..add(DiagnosticsProperty('maxBodySize', maxBodySize))..add(DiagnosticsProperty('isActive', isActive));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectorConfig&&(identical(other.maxLogs, maxLogs) || other.maxLogs == maxLogs)&&(identical(other.maxBodySize, maxBodySize) || other.maxBodySize == maxBodySize)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,maxLogs,maxBodySize,isActive);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'InspectorConfig(maxLogs: $maxLogs, maxBodySize: $maxBodySize, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $InspectorConfigCopyWith<$Res>  {
  factory $InspectorConfigCopyWith(InspectorConfig value, $Res Function(InspectorConfig) _then) = _$InspectorConfigCopyWithImpl;
@useResult
$Res call({
 int maxLogs, int? maxBodySize, bool isActive
});




}
/// @nodoc
class _$InspectorConfigCopyWithImpl<$Res>
    implements $InspectorConfigCopyWith<$Res> {
  _$InspectorConfigCopyWithImpl(this._self, this._then);

  final InspectorConfig _self;
  final $Res Function(InspectorConfig) _then;

/// Create a copy of InspectorConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxLogs = null,Object? maxBodySize = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
maxLogs: null == maxLogs ? _self.maxLogs : maxLogs // ignore: cast_nullable_to_non_nullable
as int,maxBodySize: freezed == maxBodySize ? _self.maxBodySize : maxBodySize // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InspectorConfig].
extension InspectorConfigPatterns on InspectorConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InspectorConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InspectorConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InspectorConfig value)  $default,){
final _that = this;
switch (_that) {
case _InspectorConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InspectorConfig value)?  $default,){
final _that = this;
switch (_that) {
case _InspectorConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int maxLogs,  int? maxBodySize,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InspectorConfig() when $default != null:
return $default(_that.maxLogs,_that.maxBodySize,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int maxLogs,  int? maxBodySize,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _InspectorConfig():
return $default(_that.maxLogs,_that.maxBodySize,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int maxLogs,  int? maxBodySize,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _InspectorConfig() when $default != null:
return $default(_that.maxLogs,_that.maxBodySize,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _InspectorConfig with DiagnosticableTreeMixin implements InspectorConfig {
  const _InspectorConfig({this.maxLogs = 1000, this.maxBodySize = 1048576, this.isActive = kDebugMode});
  

/// Maximum number of logs to keep in memory
@override@JsonKey() final  int maxLogs;
/// Maximum body size to log (in bytes). Set to null for unlimited.
@override@JsonKey() final  int? maxBodySize;
// 1MB default
@override@JsonKey() final  bool isActive;

/// Create a copy of InspectorConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InspectorConfigCopyWith<_InspectorConfig> get copyWith => __$InspectorConfigCopyWithImpl<_InspectorConfig>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'InspectorConfig'))
    ..add(DiagnosticsProperty('maxLogs', maxLogs))..add(DiagnosticsProperty('maxBodySize', maxBodySize))..add(DiagnosticsProperty('isActive', isActive));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InspectorConfig&&(identical(other.maxLogs, maxLogs) || other.maxLogs == maxLogs)&&(identical(other.maxBodySize, maxBodySize) || other.maxBodySize == maxBodySize)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,maxLogs,maxBodySize,isActive);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'InspectorConfig(maxLogs: $maxLogs, maxBodySize: $maxBodySize, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$InspectorConfigCopyWith<$Res> implements $InspectorConfigCopyWith<$Res> {
  factory _$InspectorConfigCopyWith(_InspectorConfig value, $Res Function(_InspectorConfig) _then) = __$InspectorConfigCopyWithImpl;
@override @useResult
$Res call({
 int maxLogs, int? maxBodySize, bool isActive
});




}
/// @nodoc
class __$InspectorConfigCopyWithImpl<$Res>
    implements _$InspectorConfigCopyWith<$Res> {
  __$InspectorConfigCopyWithImpl(this._self, this._then);

  final _InspectorConfig _self;
  final $Res Function(_InspectorConfig) _then;

/// Create a copy of InspectorConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxLogs = null,Object? maxBodySize = freezed,Object? isActive = null,}) {
  return _then(_InspectorConfig(
maxLogs: null == maxLogs ? _self.maxLogs : maxLogs // ignore: cast_nullable_to_non_nullable
as int,maxBodySize: freezed == maxBodySize ? _self.maxBodySize : maxBodySize // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
