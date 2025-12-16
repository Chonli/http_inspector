import 'package:http_inspector/src/data/config.dart';
import 'package:http_inspector/src/di/inspector.dart';

class InspectorManager {
  InspectorManager._();

  static InspectorManager? _instance;
  static InspectorManager get instance => _instance ??= InspectorManager._();

  static void init(InspectorConfig config) {
    InspectorDI.init(config);
  }
}
