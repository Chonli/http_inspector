import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http_inspector/src/data/network_log.dart';

part 'logs_filter.freezed.dart';

enum StatusGroup { all, success, redirection, clientError, serverError }

enum DurationGroup { all, lt500ms, lt2s, gte2s }

@freezed
abstract class LogsFilter with _$LogsFilter {
  const factory LogsFilter({
    @Default({...HttpMethod.values}) Set<HttpMethod> methods,
    @Default({StatusGroup.all}) Set<StatusGroup> statusGroup,
    @Default({DurationGroup.all}) Set<DurationGroup> durationGroup,
  }) = _LogsFilter;
}

extension LogsFilterExt on LogsFilter {
  bool get noActive =>
      methods.length >= 5 &&
      setEquals(statusGroup, {StatusGroup.all}) &&
      setEquals(durationGroup, {DurationGroup.all});
}

extension StatusGroupExt on StatusGroup {
  String get toText => switch (this) {
    .all => 'All',
    .success => 'Success',
    .redirection => 'Redirection',
    .clientError => 'Client Error',
    .serverError => 'Server Error',
  };
}

extension DurationGroupExt on DurationGroup {
  String get toText => switch (this) {
    .all => 'All',
    .lt500ms => '< 500ms',
    .lt2s => '500ms < 2s',
    .gte2s => '>= 2s',
  };
}
