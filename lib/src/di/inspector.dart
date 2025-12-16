import 'package:http_inspector/src/data/config.dart';
import 'package:http_inspector/src/repositories/logs.dart';

class InspectorDI {
  InspectorDI._();

  static InspectorDI? _instance;
  static InspectorDI get instance => _instance ??= InspectorDI._();

  static void init(InspectorConfig config) {
    instance._config = config;
    instance._logsRepository = LogsRepository(maxLogs: config.maxLogs);
  }

  LogsRepository _logsRepository = LogsRepository();
  LogsRepository get logsRepository => _logsRepository;

  InspectorConfig _config = InspectorConfig();
}
