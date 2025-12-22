import 'dart:async';
import 'dart:collection';

import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';

class LogsRepository {
  LogsRepository() {
    _controller.add(_logs);
  }

  final ListQueue<NetworkLog> _logs = ListQueue(30);
  final _controller = StreamController<ListQueue<NetworkLog>>.broadcast();

  void addLog(NetworkLog log) {
    if (_logs.length >= InspectorDI.maxLog) {
      _logs.removeFirst();
    }
    _logs.add(log);
    _controller.add(_logs);
  }

  void clearLog() {
    _logs.clear();
    _controller.add(_logs);
  }

  Stream<ListQueue<NetworkLog>> get logsStream => _controller.stream;

  ListQueue<NetworkLog> get logs => _logs;
}
