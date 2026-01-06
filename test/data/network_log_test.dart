import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_client_inspector/src/data/logs_filter.dart';
import 'package:http_client_inspector/src/data/network_log.dart';

void main() {
  // Helper
  NetworkLog log({
    required String id,
    String url = 'url',
    HttpMethod method = HttpMethod.get,
    int? statusCode,
    int? durationMs,
  }) => NetworkLog(
    id: id,
    url: url,
    method: method,
    timestamp: DateTime(2024),
    statusCode: statusCode,
    durationMs: durationMs,
  );

  late ListQueue<NetworkLog> logs;

  setUp(() {
    logs = ListQueue.of([
      log(
        id: '1',
        url: 'foo',
        method: HttpMethod.get,
        statusCode: 200,
        durationMs: 100,
      ), // success, lt500
      log(
        id: '2',
        url: 'bar',
        method: HttpMethod.post,
        statusCode: 301,
        durationMs: 700,
      ), // redirection, lt2s
      log(
        id: '3',
        url: 'foo2',
        method: HttpMethod.delete,
        statusCode: 404,
        durationMs: 1500,
      ), // clientError, lt2s
      log(
        id: '4',
        url: 'baaa',
        method: HttpMethod.patch,
        statusCode: 503,
        durationMs: 3000,
      ), // serverError, gte2s
    ]);
  });

  test('filters by query', () {
    const filter = LogsFilter();
    final result = logs.filtered('foo', filter);
    expect(result.length, 2);
    expect(result.first.url, contains('foo'));
  });

  test('filters by StatusGroup.redirection', () {
    final filter = LogsFilter(
      methods: {for (var m in HttpMethod.values) m},
      statusGroup: {StatusGroup.redirection},
      durationGroup: {DurationGroup.all},
    );
    final result = logs.filtered('', filter);
    expect(result.length, 1);
    expect(result.first.statusCode, greaterThanOrEqualTo(300));
    expect(result.first.statusCode, lessThan(400));
  });

  test('filters by StatusGroup.clientError', () {
    final filter = LogsFilter(
      methods: {for (var m in HttpMethod.values) m},
      statusGroup: {StatusGroup.clientError},
      durationGroup: {DurationGroup.all},
    );
    final result = logs.filtered('', filter);
    expect(result.length, 1);
    expect(result.first.statusCode, greaterThanOrEqualTo(400));
    expect(result.first.statusCode, lessThan(500));
  });

  test('filters by StatusGroup.serverError', () {
    final filter = LogsFilter(
      methods: {for (var m in HttpMethod.values) m},
      statusGroup: {StatusGroup.serverError},
      durationGroup: {DurationGroup.all},
    );
    final result = logs.filtered('', filter);
    expect(result.length, 1);
    expect(result.first.statusCode, greaterThanOrEqualTo(500));
    expect(result.first.statusCode, lessThan(600));
  });

  test('filters by DurationGroup.lt2s', () {
    final filter = LogsFilter(
      methods: {for (var m in HttpMethod.values) m},
      statusGroup: {StatusGroup.all},
      durationGroup: {DurationGroup.lt2s},
    );
    final result = logs.filtered('', filter);
    expect(result.length, 2); // logs 2 & 3: 700 and 1500 ms
    for (final l in result) {
      expect(l.durationMs, greaterThan(500));
      expect(l.durationMs, lessThan(2000));
    }
  });

  test('filters by DurationGroup.gte2s', () {
    final filter = LogsFilter(
      methods: {for (var m in HttpMethod.values) m},
      statusGroup: {StatusGroup.all},
      durationGroup: {DurationGroup.gte2s},
    );
    final result = logs.filtered('', filter);
    expect(result.length, 1); // log 4: 3000ms
    expect(result.first.durationMs, greaterThanOrEqualTo(2000));
  });
}
