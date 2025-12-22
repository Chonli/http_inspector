import 'dart:collection';

import 'package:http_inspector/src/data/config.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/repositories/logs.dart';

class InspectorDI {
  InspectorDI._();

  static InspectorDI? _instance;
  static InspectorDI get instance => _instance ??= InspectorDI._();

  final LogsRepository _logsRepository = LogsRepository();
  InspectorConfig _config = const InspectorConfig();

  static void init(InspectorConfig config) {
    instance._config = config;
  }

  static set isActive(bool value) {
    instance._config = instance._config.copyWith(isActive: value);

    if (!value) {
      instance._logsRepository.clearLog();
    }
  }

  // Access to utils data in package
  static int get maxLog => instance._config.maxLogs;

  static bool get isActive => instance._config.isActive;

  static Stream<ListQueue<NetworkLog>> get logsStream =>
      instance._logsRepository.logsStream;

  static ListQueue<NetworkLog> get logs => instance._logsRepository.logs;

  static void addLog(NetworkLog log) => instance._logsRepository.addLog(log);
}
