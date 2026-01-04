// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logs_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogsFilter implements DiagnosticableTreeMixin {

 Set<HttpMethod> get methods; Set<StatusGroup> get statusGroup; Set<DurationGroup> get durationGroup;
/// Create a copy of LogsFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogsFilterCopyWith<LogsFilter> get copyWith => _$LogsFilterCopyWithImpl<LogsFilter>(this as LogsFilter, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LogsFilter'))
    ..add(DiagnosticsProperty('methods', methods))..add(DiagnosticsProperty('statusGroup', statusGroup))..add(DiagnosticsProperty('durationGroup', durationGroup));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogsFilter&&const DeepCollectionEquality().equals(other.methods, methods)&&const DeepCollectionEquality().equals(other.statusGroup, statusGroup)&&const DeepCollectionEquality().equals(other.durationGroup, durationGroup));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(methods),const DeepCollectionEquality().hash(statusGroup),const DeepCollectionEquality().hash(durationGroup));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LogsFilter(methods: $methods, statusGroup: $statusGroup, durationGroup: $durationGroup)';
}


}

/// @nodoc
abstract mixin class $LogsFilterCopyWith<$Res>  {
  factory $LogsFilterCopyWith(LogsFilter value, $Res Function(LogsFilter) _then) = _$LogsFilterCopyWithImpl;
@useResult
$Res call({
 Set<HttpMethod> methods, Set<StatusGroup> statusGroup, Set<DurationGroup> durationGroup
});




}
/// @nodoc
class _$LogsFilterCopyWithImpl<$Res>
    implements $LogsFilterCopyWith<$Res> {
  _$LogsFilterCopyWithImpl(this._self, this._then);

  final LogsFilter _self;
  final $Res Function(LogsFilter) _then;

/// Create a copy of LogsFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? methods = null,Object? statusGroup = null,Object? durationGroup = null,}) {
  return _then(_self.copyWith(
methods: null == methods ? _self.methods : methods // ignore: cast_nullable_to_non_nullable
as Set<HttpMethod>,statusGroup: null == statusGroup ? _self.statusGroup : statusGroup // ignore: cast_nullable_to_non_nullable
as Set<StatusGroup>,durationGroup: null == durationGroup ? _self.durationGroup : durationGroup // ignore: cast_nullable_to_non_nullable
as Set<DurationGroup>,
  ));
}

}


/// Adds pattern-matching-related methods to [LogsFilter].
extension LogsFilterPatterns on LogsFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogsFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogsFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogsFilter value)  $default,){
final _that = this;
switch (_that) {
case _LogsFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogsFilter value)?  $default,){
final _that = this;
switch (_that) {
case _LogsFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<HttpMethod> methods,  Set<StatusGroup> statusGroup,  Set<DurationGroup> durationGroup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogsFilter() when $default != null:
return $default(_that.methods,_that.statusGroup,_that.durationGroup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<HttpMethod> methods,  Set<StatusGroup> statusGroup,  Set<DurationGroup> durationGroup)  $default,) {final _that = this;
switch (_that) {
case _LogsFilter():
return $default(_that.methods,_that.statusGroup,_that.durationGroup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<HttpMethod> methods,  Set<StatusGroup> statusGroup,  Set<DurationGroup> durationGroup)?  $default,) {final _that = this;
switch (_that) {
case _LogsFilter() when $default != null:
return $default(_that.methods,_that.statusGroup,_that.durationGroup);case _:
  return null;

}
}

}

/// @nodoc


class _LogsFilter with DiagnosticableTreeMixin implements LogsFilter {
  const _LogsFilter({final  Set<HttpMethod> methods = const {...HttpMethod.values}, final  Set<StatusGroup> statusGroup = const {StatusGroup.all}, final  Set<DurationGroup> durationGroup = const {DurationGroup.all}}): _methods = methods,_statusGroup = statusGroup,_durationGroup = durationGroup;
  

 final  Set<HttpMethod> _methods;
@override@JsonKey() Set<HttpMethod> get methods {
  if (_methods is EqualUnmodifiableSetView) return _methods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_methods);
}

 final  Set<StatusGroup> _statusGroup;
@override@JsonKey() Set<StatusGroup> get statusGroup {
  if (_statusGroup is EqualUnmodifiableSetView) return _statusGroup;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_statusGroup);
}

 final  Set<DurationGroup> _durationGroup;
@override@JsonKey() Set<DurationGroup> get durationGroup {
  if (_durationGroup is EqualUnmodifiableSetView) return _durationGroup;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_durationGroup);
}


/// Create a copy of LogsFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogsFilterCopyWith<_LogsFilter> get copyWith => __$LogsFilterCopyWithImpl<_LogsFilter>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LogsFilter'))
    ..add(DiagnosticsProperty('methods', methods))..add(DiagnosticsProperty('statusGroup', statusGroup))..add(DiagnosticsProperty('durationGroup', durationGroup));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogsFilter&&const DeepCollectionEquality().equals(other._methods, _methods)&&const DeepCollectionEquality().equals(other._statusGroup, _statusGroup)&&const DeepCollectionEquality().equals(other._durationGroup, _durationGroup));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_methods),const DeepCollectionEquality().hash(_statusGroup),const DeepCollectionEquality().hash(_durationGroup));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LogsFilter(methods: $methods, statusGroup: $statusGroup, durationGroup: $durationGroup)';
}


}

/// @nodoc
abstract mixin class _$LogsFilterCopyWith<$Res> implements $LogsFilterCopyWith<$Res> {
  factory _$LogsFilterCopyWith(_LogsFilter value, $Res Function(_LogsFilter) _then) = __$LogsFilterCopyWithImpl;
@override @useResult
$Res call({
 Set<HttpMethod> methods, Set<StatusGroup> statusGroup, Set<DurationGroup> durationGroup
});




}
/// @nodoc
class __$LogsFilterCopyWithImpl<$Res>
    implements _$LogsFilterCopyWith<$Res> {
  __$LogsFilterCopyWithImpl(this._self, this._then);

  final _LogsFilter _self;
  final $Res Function(_LogsFilter) _then;

/// Create a copy of LogsFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? methods = null,Object? statusGroup = null,Object? durationGroup = null,}) {
  return _then(_LogsFilter(
methods: null == methods ? _self._methods : methods // ignore: cast_nullable_to_non_nullable
as Set<HttpMethod>,statusGroup: null == statusGroup ? _self._statusGroup : statusGroup // ignore: cast_nullable_to_non_nullable
as Set<StatusGroup>,durationGroup: null == durationGroup ? _self._durationGroup : durationGroup // ignore: cast_nullable_to_non_nullable
as Set<DurationGroup>,
  ));
}


}

// dart format on
