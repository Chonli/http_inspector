import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_log.freezed.dart';

/// Domain entity representing a network request/response log
///
/// This is the core business object used throughout the application.
/// Immutable by design for thread safety and predictable behavior.
@freezed
abstract class NetworkLog with _$NetworkLog {
  const factory NetworkLog({
    required String id,
    required String url,
    required String method,
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
