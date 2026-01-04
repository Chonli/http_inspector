import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/extensions/method.dart';

void main() {
  group('HttpMethodStringExt.toEnum', () {
    test('returns correct enum for standard methods (case-insensitive)', () {
      expect('get'.toEnum, HttpMethod.get);
      expect('POST'.toEnum, HttpMethod.post);
      expect('Put'.toEnum, HttpMethod.put);
      expect('Delete'.toEnum, HttpMethod.delete);
      expect('PATCH'.toEnum, HttpMethod.patch);
      expect('HEAD'.toEnum, HttpMethod.head);
      expect('Options'.toEnum, HttpMethod.options);
      expect('Trace'.toEnum, HttpMethod.trace);
      expect('CONNECT'.toEnum, HttpMethod.connect);
    });

    test('returns unknown for invalid methods', () {
      expect('foo'.toEnum, HttpMethod.unknown);
      expect(''.toEnum, HttpMethod.unknown);
      expect('1.1'.toEnum, HttpMethod.unknown);
    });
  });

  group('HttpMethodExt', () {
    test('toText returns proper HTTP string for each enum', () {
      expect(HttpMethod.get.toText, 'GET');
      expect(HttpMethod.post.toText, 'POST');
      expect(HttpMethod.put.toText, 'PUT');
      expect(HttpMethod.delete.toText, 'DELETE');
      expect(HttpMethod.patch.toText, 'PATCH');
      expect(HttpMethod.head.toText, 'HEAD');
      expect(HttpMethod.options.toText, 'OPTIONS');
      expect(HttpMethod.trace.toText, 'TRACE');
      expect(HttpMethod.connect.toText, 'CONNECT');
      expect(HttpMethod.unknown.toText, 'UNKNOWN');
    });

    test('toColor returns proper color for each enum', () {
      expect(HttpMethod.get.toColor, Colors.blue);
      expect(HttpMethod.head.toColor, Colors.blue);
      expect(HttpMethod.post.toColor, Colors.green);
      expect(HttpMethod.put.toColor, Colors.deepPurple);
      expect(HttpMethod.patch.toColor, Colors.orange);
      expect(HttpMethod.delete.toColor, Colors.red);
      expect(HttpMethod.options.toColor, Colors.grey);
      expect(HttpMethod.trace.toColor, Colors.grey);
      expect(HttpMethod.connect.toColor, Colors.grey);
      expect(HttpMethod.unknown.toColor, Colors.grey);
    });
  });
}
