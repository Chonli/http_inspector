import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_inspector/src/data/network_log.dart';
import 'package:http_inspector/src/di/inspector.dart';

class ClientInspector extends BaseClient {
  ClientInspector({required this.innerClient});

  final Client innerClient;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (!InspectorDI.isActive) {
      return innerClient.send(request);
    }

    final start = DateTime.now();
    // Pour stocker le body s'il est accessible
    dynamic requestBody;
    Map<String, dynamic>? requestHeaders;
    if (request is Request) {
      // Peut contenir body et headers (plus haut niveau)
      requestBody = request.body;
      requestHeaders = request.headers;
    } else {
      // Cas de BaseRequest simple
      requestHeaders = request.headers;
    }

    try {
      final response = await innerClient.send(request);

      // Extraire et bufferiser la réponse
      final responseBytes = await response.stream.toBytes();
      dynamic responseBody;
      try {
        responseBody = utf8.decode(responseBytes);
      } catch (_) {
        responseBody = responseBytes;
      }

      // TODO add error message when statusCode >= 400

      final log = NetworkLog(
        id: '${request.hashCode}',
        url: request.url.toString(),
        method: request.method.toUpperCase(),
        timestamp: start,
        requestHeaders: requestHeaders,
        requestBody: requestBody,
        statusCode: response.statusCode,
        responseHeaders: response.headers,
        responseBody: responseBody,
        durationMs: DateTime.now().difference(start).inMilliseconds,
        // errorMessage & stackTrace null car try réussi
      );

      InspectorDI.addLog(log);

      // On recrée un nouveau StreamedResponse avec le même contenu de body rebufferisé
      return StreamedResponse(
        Stream.value(responseBytes),
        response.statusCode,
        contentLength: response.contentLength,
        request: response.request,
        headers: response.headers,
        isRedirect: response.isRedirect,
        reasonPhrase: response.reasonPhrase,
      );
    } catch (e, stack) {
      // capture erreur
      final log = NetworkLog(
        id: '${request.hashCode}',
        url: request.url.toString(),
        method: request.method.toUpperCase(),
        timestamp: start,
        requestHeaders: request.headers,
        requestBody: request is Request ? request.body : null,
        errorMessage: e.toString(),
        stackTrace: stack,
        durationMs: DateTime.now().difference(start).inMilliseconds,
      );
      InspectorDI.addLog(log);
      rethrow;
    }
  }
}
