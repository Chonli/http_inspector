// test/di/inspector_test.dart
import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_inspector/src/data/config.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';

void main() {
  setUp(() {
    // Réinit à chaque test avec une config prédictible
    InspectorDI.init(const InspectorConfig(maxLogs: 2, isActive: true));
  });

  NetworkLog makeLog(int i) => NetworkLog(
    id: '$i',
    url: 'http://url$i',
    method: HttpMethod.get,
    timestamp: DateTime.now(),
  );

  test('init sets initial config values', () {
    InspectorDI.init(const InspectorConfig(maxLogs: 17, isActive: false));
    expect(InspectorDI.maxLog, 17);
    expect(InspectorDI.isActive, isFalse);
  });

  test('addLog adds logs up to maximum', () {
    InspectorDI.addLog(makeLog(1));
    InspectorDI.addLog(makeLog(2));
    InspectorDI.addLog(makeLog(3)); // devrait supprimer le premier (limite 2)
    expect(InspectorDI.logs.length, 2);
    expect(InspectorDI.logs.first.id, '2');
    expect(InspectorDI.logs.last.id, '3');
  });

  test('isActive set to false clears logs', () {
    InspectorDI.addLog(makeLog(1));
    InspectorDI.isActive = false;
    expect(InspectorDI.isActive, isFalse);
    expect(InspectorDI.logs, isEmpty);
  });

  test('logsStream emits changes', () async {
    final emitted = <ListQueue<NetworkLog>>[];
    final sub = InspectorDI.logsStream.listen(emitted.add);

    InspectorDI.addLog(makeLog(1));
    InspectorDI.addLog(makeLog(2));
    await Future.delayed(Duration.zero);

    InspectorDI.isActive = false; // purge
    await Future.delayed(Duration.zero);

    expect(emitted.last, isEmpty);
    await sub.cancel();
  });
}
