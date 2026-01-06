import 'dart:collection';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http_client_inspector/src/data/logs_filter.dart';

part 'network_log.freezed.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
  connect,
  options,
  trace,
  unknown,
}

/// Domain entity representing a network request/response log
///
/// This is the core business object used throughout the application.
/// Immutable by design for thread safety and predictable behavior.
@freezed
abstract class NetworkLog with _$NetworkLog {
  const factory NetworkLog({
    required String id,
    required String url,
    required HttpMethod method,
    required DateTime timestamp,
    Map<String, dynamic>? requestHeaders,
    dynamic requestBody,
    int? statusCode,
    Map<String, dynamic>? responseHeaders,
    dynamic responseBody,
    int? durationMs,
    String? errorMessage,
    StackTrace? stackTrace,
  }) = _NetworkLog;

  const NetworkLog._();

  int? get responseBodySize => responseBody?.length;

  int? get requestBodySize => requestBody?.length;
}

extension NetworkLogListExt on ListQueue<NetworkLog> {
  ListQueue<NetworkLog> filtered(String query, LogsFilter filter) {
    final queryLowerCase = query.toLowerCase().trim();

    Iterable<NetworkLog> filteredLogs = this;

    // Filtrage StatusGroup
    if (filter.statusGroup.isNotEmpty &&
        !filter.statusGroup.contains(StatusGroup.all)) {
      filteredLogs = filteredLogs.where((log) {
        final status = log.statusCode;
        if (status == null) return false;

        return filter.statusGroup.any((group) {
          return switch (group) {
            .success => status < 300,
            .redirection => status >= 300 && status < 400,
            .clientError => status >= 400 && status < 500,
            .serverError => status >= 500 && status < 600,
            _ => true,
          };
        });
      });
    }

    // Filtrage DurationGroup
    if (filter.durationGroup.isNotEmpty &&
        !filter.durationGroup.contains(DurationGroup.all)) {
      filteredLogs = filteredLogs.where((log) {
        final duration = log.durationMs;
        if (duration == null) return false;
        return filter.durationGroup.any((group) {
          return switch (group) {
            .lt500ms => duration < 500,
            .lt2s => duration > 500 && duration < 2000,
            .gte2s => duration >= 2000,
            _ => true,
          };
        });
      });
    }

    return queryLowerCase.isEmpty
        ? .from(filteredLogs)
        : .from(
            filteredLogs
                .where(
                  (log) =>
                      log.url.toLowerCase().contains(queryLowerCase) ||
                      log.method.toString().toLowerCase().contains(
                        queryLowerCase,
                      ) ||
                      log.statusCode.toString().contains(queryLowerCase),
                )
                .toList(),
          );
  }
}
