import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_inspector/src/data/config.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';
import 'package:http_inspector/src/repositories/logs.dart';

void main() {
  late LogsRepository repo;

  setUp(() {
    InspectorDI.init(const InspectorConfig(maxLogs: 3));
    repo = LogsRepository();
  });

  NetworkLog log(int i) => NetworkLog(
    id: '$i',
    url: 'https://$i.com',
    method: HttpMethod.get,
    timestamp: DateTime.now(),
  );

  test('addLog stores logs up to maxLog limit', () {
    for (var i = 0; i < 5; i++) {
      repo.addLog(log(i));
    }
    // On attend la taille maximale, pas plus
    expect(repo.logs.length, InspectorDI.maxLog);
    expect(repo.logs.first.id, (5 - InspectorDI.maxLog).toString());
    expect(repo.logs.last.id, '4');
  });

  test('clearLog clears all logs', () {
    repo.addLog(log(1));
    repo.clearLog();
    expect(repo.logs, isEmpty);
  });

  test('logsStream emits new state on addLog and clearLog', () async {
    final emitted = <ListQueue<NetworkLog>>[];
    final sub = repo.logsStream.listen(emitted.add);

    repo.addLog(log(10));
    repo.addLog(log(11));
    await Future.delayed(Duration.zero);
    repo.clearLog();
    await Future.delayed(Duration.zero);

    expect(emitted.last, isEmpty);
    await sub.cancel();
  });
}
