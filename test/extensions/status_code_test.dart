import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_client_inspector/src/extensions/status_code.dart';

void main() {
  group('StatusCodeExt.codeColor', () {
    test('returns Colors.grey for null', () {
      int? status;
      expect(status.codeColor, Colors.grey);
    });
    test('returns Colors.green for <400', () {
      expect(200.codeColor, Colors.green);
      expect(399.codeColor, Colors.green);
    });
    test('returns Colors.orange for <500', () {
      expect(404.codeColor, Colors.orange);
      expect(499.codeColor, Colors.orange);
    });
    test('returns Colors.red for >=500', () {
      expect(500.codeColor, Colors.red);
      expect(599.codeColor, Colors.red);
      expect(900.codeColor, Colors.red);
    });
  });

  group('StatusCodeExt.surfaceColor', () {
    test('returns Colors.white for null', () {
      int? status;
      expect(status.surfaceColor, Colors.white);
    });
    test('returns Colors.white for <400', () {
      expect(200.surfaceColor, Colors.white);
      expect(399.surfaceColor, Colors.white);
    });
    test('returns Colors.orange.withAlpha(30) for <500', () {
      final expected = Colors.orange.withAlpha(30);
      expect(404.surfaceColor, expected);
      expect(499.surfaceColor, expected);
    });
    test('returns Colors.red.withAlpha(30) for >=500', () {
      final expected = Colors.red.withAlpha(30);
      expect(500.surfaceColor, expected);
      expect(599.surfaceColor, expected);
      expect(1000.surfaceColor, expected);
    });
  });

  group('StatusCodeExt.toText', () {
    test('returns value as string if not null', () {
      expect(200.toText, '200');
      expect(404.toText, '404');
    });
    test('returns N/A for null', () {
      int? status;
      expect(status.toText, 'N/A');
    });
  });
}
