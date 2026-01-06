import 'package:flutter_test/flutter_test.dart';
import 'package:http_client_inspector/src/data/logs_filter.dart';
import 'package:http_client_inspector/src/data/network_log.dart';

void main() {
  group('LogsFilterExt', () {
    test(
      'noActive true if all sets are at default (all, all, all HttpMethod)',
      () {
        const filter = LogsFilter(); // tous défauts
        expect(filter.noActive, isTrue);
      },
    );

    test('noActive false if methods is not all', () {
      const filter = LogsFilter(
        methods: {HttpMethod.get}, // < 5
      );
      expect(filter.noActive, isFalse);
    });

    test('noActive false if statusGroup omits all', () {
      const filter = LogsFilter(
        statusGroup: {StatusGroup.success, StatusGroup.redirection},
      );
      expect(filter.noActive, isFalse);
    });

    test('noActive false if durationGroup omits all', () {
      const filter = LogsFilter(durationGroup: {DurationGroup.lt2s});
      expect(filter.noActive, isFalse);
    });
  });

  group('StatusGroupExt.toText', () {
    test('toText returns correct text for all values', () {
      expect(StatusGroup.all.toText, 'All');
      expect(StatusGroup.success.toText, 'Success');
      expect(StatusGroup.redirection.toText, 'Redirection');
      expect(StatusGroup.clientError.toText, 'Client Error');
      expect(StatusGroup.serverError.toText, 'Server Error');
    });
  });

  group('DurationGroupExt.toText', () {
    test('toText returns correct text for all values', () {
      expect(DurationGroup.all.toText, 'All');
      expect(DurationGroup.lt500ms.toText, '< 500ms');
      expect(DurationGroup.lt2s.toText, '500ms < 2s');
      expect(DurationGroup.gte2s.toText, '>= 2s');
    });
  });
}
