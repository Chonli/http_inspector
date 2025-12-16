import 'dart:collection';

import 'package:http_inspector/src/data/network_log.dart';

const _defaultMaxLog = 1000;

class LogsRepository {
  LogsRepository({this.maxLogs = _defaultMaxLog});

  final int maxLogs;
  final ListQueue<NetworkLog> _logs = ListQueue(30);

  void addLog(NetworkLog log) {
    if (_logs.length >= maxLogs) {
      _logs.removeFirst();
    }
    _logs.add(log);
  }

  void clearLog() {
    _logs.clear();
  }
}
