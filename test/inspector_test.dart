// test/src/inspector_test.dart
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http_client_inspector/src/inspector.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

class MockStreamedResponse extends Mock implements StreamedResponse {}

void main() {
  setUpAll(() {
    // Pour des valeurs custom si nécessaire
    registerFallbackValue(Request('GET', Uri.parse('https://example.com')));
  });

  group('ClientInspector', () {
    late MockClient mockClient;
    late ClientInspector clientInspector;

    setUp(() {
      mockClient = MockClient();
      clientInspector = ClientInspector(innerClient: mockClient);
    });

    test('send logs network info and returns a valid response', () async {
      // Arrange
      final request = Request('GET', Uri.parse('https://example.com/data'));
      final bytes = utf8.encode('{"msg":"hello"}');
      final responseStream = ByteStream.fromBytes(bytes);

      final mockResp = MockStreamedResponse();
      when(() => mockResp.stream).thenAnswer((_) => responseStream);
      when(() => mockResp.statusCode).thenReturn(200);
      when(() => mockResp.contentLength).thenReturn(bytes.length);
      when(() => mockResp.request).thenReturn(request);
      when(
        () => mockResp.headers,
      ).thenReturn({'content-type': 'application/json'});
      when(() => mockResp.isRedirect).thenReturn(false);
      when(() => mockResp.reasonPhrase).thenReturn('OK');

      when(() => mockClient.send(request)).thenAnswer((_) async => mockResp);

      // Act
      final resp = await clientInspector.send(request);

      // Assert
      expect(await resp.stream.bytesToString(), '{"msg":"hello"}');
      expect(resp.statusCode, 200);
      // ICI tu peux vérifier InspectDI.addLog avec un mock ou comportement
    });
  });
}
