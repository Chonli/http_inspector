import 'package:flutter_test/flutter_test.dart';
import 'package:http_inspector/src/extensions/data.dart';

void main() {
  group('ResponseBodyExt.formatSize', () {
    test('returns bytes for values less than 1024', () {
      expect(0.formatSize, '0 B');
      expect(100.formatSize, '100 B');
      expect(1023.formatSize, '1023 B');
    });

    test('returns kilobytes for values between 1024 and 1 MiB', () {
      expect(1024.formatSize, '1.0 KB');
      expect(2048.formatSize, '2.0 KB');
      expect(1536.formatSize, '1.5 KB');
      expect(1048575.formatSize, '${(1048575 / 1024).toStringAsFixed(1)} KB');
    });

    test('returns megabytes for values >= 1 MiB', () {
      expect(1048576.formatSize, '1.00 MB');
      expect(10485760.formatSize, '10.00 MB');
      expect(2097152.formatSize, '2.00 MB');
    });
  });
}
