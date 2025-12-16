import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';

/// Configuration for Droido initialization
///
/// Use the builder pattern for easy configuration:
/// ```dart
/// final config = DroidoConfig(
///   maxLogs: 1000,
///   enableNotification: true,
/// );
/// ```
@freezed
abstract class InspectorConfig with _$InspectorConfig {
  const factory InspectorConfig({
    /// Maximum number of logs to keep in memory
    @Default(1000) int maxLogs,

    /// Maximum body size to log (in bytes). Set to null for unlimited.
    @Default(1048576) int? maxBodySize, // 1MB default
  }) = _InspectorConfig;
}
