// test/extensions/time_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_client_inspector/src/extensions/time.dart';

void main() {
  group('DateTimeExt.formatDate', () {
    test('formats time as HH:mm:ss', () {
      final dt = DateTime(2023, 10, 5, 12, 34, 56);
      expect(dt.formatDate, '12:34:56');

      final dt2 = DateTime(1999, 1, 1, 8, 2, 9);
      expect(dt2.formatDate, '08:02:09');
    });
  });

  group('IntTimeExt.formatMsDate', () {
    test('returns ms string for non-null int', () {
      expect(123.formatMsDate, '123ms');
      expect(0.formatMsDate, '0ms');
    });
    test('returns -- if value is null', () {
      int? v;
      expect(v.formatMsDate, '--');
    });
  });

  group('IntTimeExt.durationColor', () {
    test('returns green for <=500ms', () {
      expect(0.durationColor, Colors.green);
      expect(200.durationColor, Colors.green);
      expect(500.durationColor, Colors.green);
    });
    test('returns orange for <=2000ms but >500ms', () {
      expect(501.durationColor, Colors.orange);
      expect(1500.durationColor, Colors.orange);
      expect(2000.durationColor, Colors.orange);
    });
    test('returns red for >2000ms', () {
      expect(2001.durationColor, Colors.red);
      expect(9999.durationColor, Colors.red);
    });
    test('returns black for null', () {
      int? v;
      expect(v.durationColor, Colors.black);
    });
  });
}
