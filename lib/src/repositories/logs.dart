import 'dart:async';
import 'dart:collection';

import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';

class LogsRepository {
  LogsRepository() {
    _controller.add(_logs);
  }

  final ListQueue<NetworkLog> _logs = ListQueue(30);
  final _controller = StreamController<ListQueue<NetworkLog>>();

  void addLog(NetworkLog log) {
    if (_logs.length >= InspectorDI.maxLog) {
      _logs.removeFirst();
    }
    _logs.add(log);
  }

  void clearLog() {
    _logs.clear();
  }

  Stream<ListQueue<NetworkLog>> get logsStream => _controller.stream;

  ListQueue<NetworkLog> get logs => _logs;
}
